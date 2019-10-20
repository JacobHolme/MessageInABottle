//
//  SettingsViewController.swift
//  MessageInABottle
//
//  Created by Joshua Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    
    var backgroundActivityLabel = UILabel()
    var backgroundActivityDescription = UILabel()
    var backgroundActivityToggle = UISwitch()
    var backgroundActivityStackViewRowTop = UIStackView()
    var backgroundActivityStackViewRowFull = UIStackView()
    
    var locationSharingLabel = UILabel()
    var locationSharingDescription = UILabel()
    var locationSharingToggle = UISwitch()
    var locationSharingStackViewRowTop = UIStackView()
    var locationSharingStackViewRowFull = UIStackView()
    
    var batterySaverLabel = UILabel()
    var batterySaverDescription = UILabel()
    var batterySaverToggle = UISwitch()
    var batterySaverStackViewRowTop = UIStackView()
    var batterySaverStackViewRowFull = UIStackView()
    
    var settingsStackView = UIStackView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        backgroundActivityLabel.text = "Background Activity"
        backgroundActivityLabel.font = UIFont.boldSystemFont(ofSize: 24)
        backgroundActivityDescription.text = "This is a description of the Background Activity setting."
        
        backgroundActivityStackViewRowFull.axis = .vertical
        backgroundActivityStackViewRowTop.addArrangedSubview(backgroundActivityLabel)
        backgroundActivityStackViewRowTop.addArrangedSubview(backgroundActivityToggle)
        backgroundActivityStackViewRowFull.addArrangedSubview(backgroundActivityStackViewRowTop)
        backgroundActivityStackViewRowFull.addArrangedSubview(backgroundActivityDescription)
        
        locationSharingLabel.text = "Send Location"
        locationSharingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        locationSharingDescription.text = "This is a description of the Send Location setting."
        
        locationSharingStackViewRowFull.axis = .vertical
        locationSharingStackViewRowTop.addArrangedSubview(locationSharingLabel)
        locationSharingStackViewRowTop.addArrangedSubview(locationSharingToggle)
        locationSharingStackViewRowFull.addArrangedSubview(locationSharingStackViewRowTop)
        locationSharingStackViewRowFull.addArrangedSubview(locationSharingDescription)
    
        batterySaverLabel.text = "Battery Saver"
        batterySaverLabel.font = UIFont.boldSystemFont(ofSize: 24)
        batterySaverDescription.text = "This is a description of the Battery Location setting."
        
        batterySaverStackViewRowFull.axis = .vertical
        batterySaverStackViewRowTop.addArrangedSubview(batterySaverLabel)
        batterySaverStackViewRowTop.addArrangedSubview(batterySaverToggle)
        batterySaverStackViewRowFull.addArrangedSubview(batterySaverStackViewRowTop)
        batterySaverStackViewRowFull.addArrangedSubview(batterySaverDescription)
        
        settingsStackView.axis = .vertical
        settingsStackView.distribution = .fillEqually
        settingsStackView.addArrangedSubview(backgroundActivityStackViewRowFull)
        settingsStackView.addArrangedSubview(locationSharingStackViewRowFull)
        settingsStackView.addArrangedSubview(batterySaverStackViewRowFull)
        
        view.addSubview(settingsStackView)
        
        settingsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            settingsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            settingsStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            settingsStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
       
    }
}
