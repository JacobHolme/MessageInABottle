//
//  ChatViewController.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Instance of Network Service
    let networkService = NetworkService()
    
    // Instance of Date
    let date = Date()
    
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
        return textField
    }()
    
    override func viewDidLoad() {
        
        // Set Navigation Bar Title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Specify Delegate
        networkService.delegate = self
        
        // Add Subviews
        view.addSubview(messageView)
        messageView.addSubview(sendButton)
        messageView.addSubview(textField)
        view.addSubview(messagesTableView)
        
        setupTableView()
        constrainViews()
        
    }
    
    func setupTableView() {
        messagesTableView.register(MessageLeftCell.self, forCellReuseIdentifier: "LeftMessage")
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        
    }
    
    func constrainViews() {
        NSLayoutConstraint.activate([
            
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
    
    // Sending Message button action
    @objc func sendMessage() {
        let user = User(firstName: DataService.firstName ?? "Test", lastName: DataService.lastName ?? "Test")
        let message = Message(sender: user.asString(), content: "Hello World", timestamp: String(describing: date.timeIntervalSince1970))
        networkService.sendOut(message: message)
    }
    
    // MARK: TableView Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: "LeftMessage", for: indexPath)
        return cell
    }
    
    
}

extension ChatViewController: NetworkServiceDelegate {
    
    // Functions Required by the delegate method
    func connectedDevicesChanged(manager: NetworkService, connectedDevice: [String]) {
        OperationQueue.main.addOperation {
            // Do Something
        }
    }
    
    func receivedMessage(manager: NetworkService, message: Message) {
        OperationQueue.main.addOperation {
            // Do Something
        }
    }
    
    
}
