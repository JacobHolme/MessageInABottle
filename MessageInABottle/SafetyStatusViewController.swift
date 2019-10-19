//
//  SafetyStatusViewController.swift
//  MessageInABottle
//
//  Created by Jacob Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class SafetyStatusViewController: UIViewController
{
    var safetyStatusTitle = UILabel()
    var descriptionLabel = UILabel()
    var safeButton = UIButton()
    var stuckButton = UIButton()
    var InjuredNotSeriousButton = UIButton()
    var InjuredNeedsAttentionButton = UIButton()
    var row1Stack = UIStackView()
    var row2Stack = UIStackView()
    var buttonStackStack = UIStackView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        safetyStatusTitle.text = "Safety Status"
        safetyStatusTitle.textColor = .black
        safetyStatusTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 45.0)
        
        descriptionLabel.text = "Description of the Safety Status"
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 30.0)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 4
        descriptionLabel.textAlignment = .center;
        
        safeButton.setTitle("Safe", for: .normal)
        safeButton.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        safeButton.layer.cornerRadius = 15
        safeButton.layer.borderWidth = 5
        safeButton.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        stuckButton.setTitle("Stuck", for: .normal)
        stuckButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        stuckButton.layer.cornerRadius = 15
        stuckButton.layer.borderWidth = 5
        stuckButton.layer.borderColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        
        InjuredNotSeriousButton.setTitle("Injured Not Serious", for: .normal)
        InjuredNotSeriousButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        InjuredNotSeriousButton.layer.cornerRadius = 15
        InjuredNotSeriousButton.layer.borderWidth = 5
        InjuredNotSeriousButton.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        InjuredNeedsAttentionButton.setTitle("Need Medical Attention", for: .normal)
        InjuredNeedsAttentionButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        InjuredNeedsAttentionButton.layer.cornerRadius = 15
        InjuredNeedsAttentionButton.layer.borderWidth = 5
        InjuredNeedsAttentionButton.layer.borderColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        
        row1Stack.distribution = .fillEqually
        row1Stack.spacing = 24
        row1Stack.axis = .horizontal
        row1Stack.addArrangedSubview(safeButton)
        row1Stack.addArrangedSubview(stuckButton)
        
        row2Stack.distribution = .fillEqually
        row2Stack.spacing = 24
        row2Stack.axis = .horizontal
        row2Stack.addArrangedSubview(InjuredNotSeriousButton)
        row2Stack.addArrangedSubview(InjuredNeedsAttentionButton)
        
        buttonStackStack.distribution = .fillEqually
        buttonStackStack.spacing = 24
        buttonStackStack.axis = .vertical
        buttonStackStack.addArrangedSubview(row1Stack)
        buttonStackStack.addArrangedSubview(row2Stack)
        
        view.addSubview(safetyStatusTitle)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonStackStack)

        safetyStatusTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackStack.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
                    buttonStackStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    buttonStackStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                    buttonStackStack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
                    buttonStackStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
                    buttonStackStack.heightAnchor.constraint(equalToConstant: view.frame.width - 48),
                    
                    
                    safetyStatusTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    safetyStatusTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                    safetyStatusTitle.heightAnchor.constraint(equalToConstant: 50),
                    
                    descriptionLabel.topAnchor.constraint(equalTo: safetyStatusTitle.bottomAnchor, constant: 24),
                    descriptionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    descriptionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                    
                ])
            }
        }

