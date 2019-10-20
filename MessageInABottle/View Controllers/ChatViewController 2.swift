//
//  ChatViewController.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: Data
    
    // Array of Messages
    var messages: [Message] = []

    // Instance of Network Service
    let networkService = NetworkService()
    
    // MARK: Views
    
    var messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var messageView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        return button
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Text something here..."
        textField.returnKeyType = .send
        return textField
    }()
    
    let dismissKeyboardGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    
    // MARK: View Did Load and Setup View
    
    override func viewDidLoad() {
        
        // Setup Notification for keyboard responses
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Set UITextField Delegate
        textField.delegate = self
        
        // Bring Up Login Screen if they have not made an account
        if DataService.firstName == nil || DataService.lastName == nil {
            let authenticationVC = LoginScreen()
            present(authenticationVC, animated: true, completion: nil)
        }

        // Specify Delegate
        networkService.delegate = self
        
        // Add Subviews
        view.addGestureRecognizer(dismissKeyboardGR)
        view.addSubview(messageView)
        messageView.addSubview(sendButton)
        messageView.addSubview(textField)
        view.addSubview(messagesTableView)
        
        setupTableView()
        constrainViews()
        setupNavigationBar()
        
        // if Messages are not empty scroll to the bottom by default
        if !messages.isEmpty {
            messagesTableView.scrollToBottom()
        }
    }
    
    func setupNavigationBar() {
        
        // Refresh Button
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshBrowsingAndAdvertising))
            
        
    }
    
    func setupTableView() {
        messagesTableView.register(MessageLeftCell.self, forCellReuseIdentifier: "LeftMessage")
        messagesTableView.register(MessageRightCell.self, forCellReuseIdentifier: "RightMessage")
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.estimatedRowHeight = 100
        messagesTableView.rowHeight = UITableView.automaticDimension
        messagesTableView.separatorStyle = .none
        
        messagesTableView.reloadData()
        
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
            messagesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            messagesTableView.bottomAnchor.constraint(equalTo: messageView.topAnchor),
            messagesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            messagesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            messageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            messageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            messageView.heightAnchor.constraint(equalToConstant: 90),
        
            sendButton.rightAnchor.constraint(equalTo: messageView.rightAnchor, constant: -20),
            sendButton.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -40),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            sendButton.widthAnchor.constraint(equalToConstant: 80),
            
            textField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -20),
            textField.leftAnchor.constraint(equalTo: messageView.leftAnchor, constant: 20),
            textField.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -40),
            textField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: Keyboard Handlers
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y += keyboardFrame.height
        }
    }
    
    // Dismisses Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func refreshBrowsingAndAdvertising() {
        networkService.stopBrowsingAndAdvertising()
        networkService.startBrowsingAndAdvertising()
    }
    
    // Sending Message button action
    @objc func sendMessage() {
        
        if !(textField.text == "") {
            let message = Message(sender: DataService.currentUserID, content: textField.text!, timestamp: String(describing: NSDate().timeIntervalSince1970))
            messages.append(message)
            messagesTableView.reloadData()
            messagesTableView.scrollToBottom()
            networkService.sendOut(message: message)
            textField.text = ""
        }
    }
    
    // MARK: TableView Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if messages[indexPath.row].sender != DataService.currentUserID {
            
            let cell = messagesTableView.dequeueReusableCell(withIdentifier: "LeftMessage", for: indexPath) as! MessageLeftCell
            cell.bubbleView.text = messages[indexPath.row].content
            cell.nameLabel.text = messages[indexPath.row].sender
            return cell
            
        } else {
            
            let cell = messagesTableView.dequeueReusableCell(withIdentifier: "RightMessage", for: indexPath) as! MessageRightCell
            cell.bubbleView.text = messages[indexPath.row].content
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return UITableView.automaticDimension
    
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        sendMessage()
        return true
    }
}

// MARK: Network Service Delegate Extension

extension ChatViewController: NetworkServiceDelegate {
    
    // Functions Required by the delegate method
    func connectedDevicesChanged(manager: NetworkService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.navigationItem.title = "\(connectedDevices)"
        }
    }
    
    func receivedMessage(manager: NetworkService, message: Message) {
        OperationQueue.main.addOperation {
            self.messages.append(message)
            self.messagesTableView.reloadData()
            self.messagesTableView.scrollToBottom()
        }
    }
}

extension UITableView {

    func scrollToBottom(){

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.numberOfRows(inSection: self.numberOfSections - 1) - 1, section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
