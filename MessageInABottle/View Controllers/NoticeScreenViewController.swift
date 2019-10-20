//
//  NoticeScreen.swift
//  MessageInABottle
//
//  Created by Jacob Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class NoticeScreenViewController: UIViewController
{

    var warningLogo = UIImageView()
    var noticeLabel = UILabel()
    var descriptionLabel = UILabel()
    var understandButton = UIButton()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        
        warningLogo.image = UIImage(named: "WarningSign")
        
        noticeLabel.text = "NOTICE"
        noticeLabel.textColor = .red
        noticeLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 45.0)
        
        descriptionLabel.text = "This app sends messages through a peer-to-peer network. This means that you MUST be within range of another user of the app to join the network, and send messages to other phones. This app is only intended for use during cellular service inturruptions, and is NOT intended to replace calling emergency services if cellular signal is available. If you are within range of cellular service and need assistance, please call emergency services immediately."
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 18.0)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 24
        descriptionLabel.textAlignment = .center;
        
        understandButton.setTitle("I understand", for: .normal)
        understandButton.backgroundColor = UIColor(red: 251.0/255.0, green: 223.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        understandButton.layer.cornerRadius = 15
        understandButton.layer.borderWidth = 5
        understandButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        understandButton.setTitleColor(.black, for: .normal)
        understandButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.addSubview(warningLogo)
        view.addSubview(noticeLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(understandButton)
        

        
        warningLogo.translatesAutoresizingMaskIntoConstraints = false
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        understandButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
            
            warningLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            warningLogo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            warningLogo.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            warningLogo.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            warningLogo.heightAnchor.constraint(equalToConstant: view.frame.width - 48),
            
            noticeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noticeLabel.topAnchor.constraint(equalTo: warningLogo.bottomAnchor, constant: 24),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: noticeLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            understandButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            understandButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            understandButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            understandButton.heightAnchor.constraint(equalToConstant: view.frame.width / 9)
            
        ])
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

