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
        
        logo.image = UIImage(named: "Logo")
        
        appNameLabel.text = "Message in a Bottle"
        
        firstNameLabel.text = "First Name:"
        firstNameTextField.placeholder = "Please enter your first name"
        firstNameTextField.borderStyle = .roundedRect
        lastNameLabel.text = "Last Name:"
        lastNameTextField.placeholder = "Please enter your last name"
        lastNameTextField.borderStyle = .roundedRect

        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        loginButton.layer.cornerRadius = 15
        loginButton.layer.borderWidth = 5
        loginButton.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        firstNameRow.spacing = 6
        firstNameRow.addArrangedSubview(firstNameLabel)
        firstNameRow.addArrangedSubview(firstNameTextField)
        
        lastNameRow.spacing = 6
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
            logo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: outerFormStack.bottomAnchor, constant: 24),
            loginButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            loginButton.heightAnchor.constraint(equalToConstant: view.frame.width / 9)
        ])
    }
}

