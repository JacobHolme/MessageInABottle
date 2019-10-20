//
//  LoginScreen.swift
//  MessageInABottle
//
//  Created by Jacob Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController
{

    var logo = UIImageView()
    var appNameLabel = UILabel()
    var firstNameLabel = UILabel()
    var lastNameLabel = UILabel()
    var firstNameTextField = UITextField()
    var lastNameTextField = UITextField()
    var loginButton = UIButton()
    var outerFormStack = UIStackView()
    var firstNameRow = UIStackView()
    var lastNameRow = UIStackView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
<<<<<<< HEAD
        view.backgroundColor = .white
        
        logo.image = UIImage(named: "Logo")
=======
        view.backgroundColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1)
>>>>>>> master
        
        logo.image = UIImage(named: "newLogo")
        logo.tintColor = .white
        
        //appNameLabel.text = "Message in a Bottle"
        
        firstNameLabel.text = "First Name:"
        firstNameTextField.placeholder = "Please enter your first name"
        firstNameTextField.borderStyle = .roundedRect
        lastNameLabel.text = "Last Name:"
        lastNameTextField.placeholder = "Please enter your last name"
        lastNameTextField.borderStyle = .roundedRect

        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor(red: 69.0/255.0, green: 228.0/255.0, blue: 119.0/255.0, alpha: 1)
        loginButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 5
        loginButton.layer.borderColor = UIColor(red: 0.0/255.0, green: 141.0/255.0, blue: 39.0/255.0, alpha: 1).cgColor
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        firstNameRow.spacing = 6
        firstNameRow.distribution = .equalSpacing
        firstNameRow.addArrangedSubview(firstNameLabel)
        firstNameRow.addArrangedSubview(firstNameTextField)
        
        lastNameRow.spacing = 6
        lastNameRow.distribution = .equalSpacing
        lastNameRow.addArrangedSubview(lastNameLabel)
        lastNameRow.addArrangedSubview(lastNameTextField)

        
        outerFormStack.distribution = .fillEqually
        outerFormStack.spacing = 24
        outerFormStack.axis = .vertical
        outerFormStack.addArrangedSubview(firstNameRow)
        outerFormStack.addArrangedSubview(lastNameRow)
        
        
        view.addSubview(outerFormStack)
        view.addSubview(logo)
        view.addSubview(appNameLabel)
        view.addSubview(loginButton)

        
        outerFormStack.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            outerFormStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            outerFormStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            outerFormStack.heightAnchor.constraint(equalToConstant: 100),
            outerFormStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.height / -3.5),
            logo.heightAnchor.constraint(equalToConstant: 250),
            logo.widthAnchor.constraint(equalToConstant: 250),
            
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: outerFormStack.bottomAnchor, constant: 24),
            loginButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            loginButton.heightAnchor.constraint(equalToConstant: view.frame.width / 9)
        ])
    }
    
    @objc func loginButtonPressed() {
        DataService.firstName = firstNameTextField.text!
        DataService.lastName = lastNameTextField.text!
        
        dismiss(animated: true, completion: nil)
    }
}

