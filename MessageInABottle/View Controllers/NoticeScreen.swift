//
//  NoticeScreen.swift
//  MessageInABottle
//
//  Created by Jacob Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class NoticeScreen: UIViewController
{

    var warningLogo = UIImageView()
    var noticeLabel = UILabel()
    var descriptionLabel = UILabel()
    var understandButton = UIButton()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        warningLogo.image = UIImage(named: "WarningLogo")
        
        noticeLabel.text = "NOTICE"
        noticeLabel.textColor = .red
        noticeLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 45.0)
        
        descriptionLabel.text = "Description of apps functionality without being connected to a network"
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 30.0)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 4
        descriptionLabel.textAlignment = .center;
        
        understandButton.setTitle("I understand", for: .normal)
        understandButton.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        understandButton.layer.cornerRadius = 15
        understandButton.layer.borderWidth = 5
        understandButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        understandButton.setTitleColor(.black, for: .normal)
        
        
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
            
            noticeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noticeLabel.topAnchor.constraint(equalTo: warningLogo.bottomAnchor),
            
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
}

