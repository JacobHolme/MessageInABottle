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
    var safeLabel = UILabel()

    
    var stuckButton = UIButton()
    var stuckLabel = UILabel()
    
    var injuredNotSeriousButton = UIButton()
    var injuredNotSeriousLabel = UILabel()
    
    var injuredNeedsAttentionButton = UIButton()
    var injuredNeedsAttentionLabel = UILabel()
    
    var row1Stack = UIStackView()
    var row2Stack = UIStackView()
    var buttonStackStack = UIStackView()
    var keyIconColumn = UIStackView()
    var keyLabelColumn = UIStackView()
    
    var checkImageView = UIImageView()
    var lineImageView = UIImageView()
    var xImageView = UIImageView()
    var exclamationImageView = UIImageView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        
        safetyStatusTitle.text = "Safety Status"
        safetyStatusTitle.textColor = .black
        safetyStatusTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 45.0)

        checkImageView.image = UIImage(named: "checkGlyph")
        checkImageView.contentMode = .scaleAspectFit
        checkImageView.tintColor = .black
        lineImageView.image = UIImage(named: "lineGlyph")
        lineImageView.contentMode = .scaleAspectFit
        lineImageView.tintColor = .black
        xImageView.image = UIImage(named: "closeGlyph")
        xImageView.contentMode = .scaleAspectFit
        xImageView.tintColor = .black
        exclamationImageView.image = UIImage(named: "ExclamationPoint")
        exclamationImageView.contentMode = .scaleAspectFit
        exclamationImageView.tintColor = .black
        
        safeButton.setImage(UIImage(named: "checkGlyph"), for: .normal)
        safeButton.tintColor = UIColor(red: 8.0/255.0, green: 127.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        safeButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        safeButton.backgroundColor = UIColor(red: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        safeButton.layer.cornerRadius = 15
        safeButton.layer.borderWidth = 5
        safeButton.layer.borderColor = UIColor(red: 8.0/255.0, green: 127.0/255.0, blue: 35.0/255.0, alpha: 1.0).cgColor
        safeLabel.text = "I am okay. I am safe, require no assistance evacuating, and am not injured."
        safeLabel.textColor = .black
        safeLabel.font = UIFont(name:"HelveticaNeue", size: 15.0)
        safeLabel.lineBreakMode = .byWordWrapping
        safeLabel.numberOfLines = 4
        safeLabel.textAlignment = .left;
        
        stuckButton.setImage(UIImage(named: "lineGlyph"), for: .normal)
        stuckButton.tintColor = UIColor(red: 200.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        stuckButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        stuckButton.backgroundColor = UIColor(red: 255.0/255.0, green: 235.0/255.0, blue: 59.0/255.0, alpha: 1.0)
        stuckButton.layer.cornerRadius = 15
        stuckButton.layer.borderWidth = 5
        stuckButton.layer.borderColor = UIColor(red: 200.0/255.0, green: 185.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        stuckLabel.text = "I am not injured, but require assistance evacuating. I am in no immediate danger, but do still need help."
        stuckLabel.textColor = .black
        stuckLabel.font = UIFont(name:"HelveticaNeue", size: 15.0)
        stuckLabel.lineBreakMode = .byWordWrapping
        stuckLabel.numberOfLines = 5
        stuckLabel.textAlignment = .left;
        
        injuredNotSeriousButton.setImage(UIImage(named: "closeGlyph"), for: .normal)
        injuredNotSeriousButton.tintColor = UIColor(red: 197.0/255.0, green: 98.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        injuredNotSeriousButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        injuredNotSeriousButton.backgroundColor = UIColor(red: 255.0/255.0, green: 145.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        injuredNotSeriousButton.layer.cornerRadius = 15
        injuredNotSeriousButton.layer.borderWidth = 5
        injuredNotSeriousButton.layer.borderColor = UIColor(red: 197.0/255.0, green: 98.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        injuredNotSeriousLabel.text = "I have sustained injuries, but nothing severe enough to be life threatening. I need assistance evacuating and will need medical evaluation."
        injuredNotSeriousLabel.textColor = .black
        injuredNotSeriousLabel.font = UIFont(name:"HelveticaNeue", size: 15.0)
        injuredNotSeriousLabel.lineBreakMode = .byWordWrapping
        injuredNotSeriousLabel.numberOfLines = 7
        injuredNotSeriousLabel.textAlignment = .left;
        
        injuredNeedsAttentionButton.setImage(UIImage(named: "ExclamationPoint"), for: .normal)
        injuredNeedsAttentionButton.tintColor = UIColor(red: 163.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        injuredNeedsAttentionButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        injuredNeedsAttentionButton.backgroundColor = UIColor(red: 221.0/255.0, green: 44.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        injuredNeedsAttentionButton.layer.cornerRadius = 15
        injuredNeedsAttentionButton.layer.borderWidth = 5
        injuredNeedsAttentionButton.layer.borderColor = UIColor(red: 163.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        injuredNeedsAttentionLabel.text = "I am severely injured, require immediate medical attention, and need assistance evacuating."
        injuredNeedsAttentionLabel.textColor = .black
        injuredNeedsAttentionLabel.font = UIFont(name:"HelveticaNeue", size: 15.0)
        injuredNeedsAttentionLabel.lineBreakMode = .byWordWrapping
        injuredNeedsAttentionLabel.numberOfLines = 4
        injuredNeedsAttentionLabel.textAlignment = .left;
        
        row1Stack.distribution = .fillEqually
        row1Stack.spacing = 24
        row1Stack.axis = .horizontal
        row1Stack.addArrangedSubview(safeButton)
        row1Stack.addArrangedSubview(stuckButton)
        
        row2Stack.distribution = .fillEqually
        row2Stack.spacing = 24
        row2Stack.axis = .horizontal
        row2Stack.addArrangedSubview(injuredNotSeriousButton)
        row2Stack.addArrangedSubview(injuredNeedsAttentionButton)
        
        buttonStackStack.distribution = .fillEqually
        buttonStackStack.spacing = 24
        buttonStackStack.axis = .vertical
        buttonStackStack.addArrangedSubview(row1Stack)
        buttonStackStack.addArrangedSubview(row2Stack)
        
        keyIconColumn.distribution = .fillEqually
        keyIconColumn.spacing = 24
        keyIconColumn.axis = .vertical
        keyIconColumn.addArrangedSubview(checkImageView)
        keyIconColumn.addArrangedSubview(lineImageView)
        keyIconColumn.addArrangedSubview(xImageView)
        keyIconColumn.addArrangedSubview(exclamationImageView)
        
        keyLabelColumn.distribution = .fillEqually
        keyLabelColumn.spacing = 24
        keyLabelColumn.axis = .vertical
        keyLabelColumn.addArrangedSubview(safeLabel)
        keyLabelColumn.addArrangedSubview(stuckLabel)
        keyLabelColumn.addArrangedSubview(injuredNotSeriousLabel)
        keyLabelColumn.addArrangedSubview(injuredNeedsAttentionLabel)

        
        
        
        
        view.addSubview(safetyStatusTitle)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonStackStack)
        view.addSubview(keyIconColumn)
        view.addSubview(keyLabelColumn)


        safetyStatusTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackStack.translatesAutoresizingMaskIntoConstraints = false
        keyIconColumn.translatesAutoresizingMaskIntoConstraints = false
        keyLabelColumn.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
                    buttonStackStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    buttonStackStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                    buttonStackStack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
                    buttonStackStack.heightAnchor.constraint(equalToConstant: view.frame.width - 48),
                    
                    
                    safetyStatusTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    safetyStatusTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                    safetyStatusTitle.heightAnchor.constraint(equalToConstant: 50),
                    
                    keyIconColumn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                    keyIconColumn.bottomAnchor.constraint(equalTo: buttonStackStack.topAnchor, constant: -24),
                    keyIconColumn.topAnchor.constraint(equalTo: safetyStatusTitle.bottomAnchor, constant: 24),
                    keyIconColumn.widthAnchor.constraint(equalToConstant: view.frame.width / 5),
            
                    keyLabelColumn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
                    keyLabelColumn.bottomAnchor.constraint(equalTo: buttonStackStack.topAnchor, constant: -24),
                    keyLabelColumn.topAnchor.constraint(equalTo: safetyStatusTitle.bottomAnchor, constant: 24),
                    keyLabelColumn.leadingAnchor.constraint(equalTo: keyIconColumn.trailingAnchor, constant: 24)
        ])
    }
}

