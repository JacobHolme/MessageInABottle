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

        view.backgroundColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        
        backgroundActivityLabel.text = "Background Activity"
        backgroundActivityLabel.font = UIFont.boldSystemFont(ofSize: 24)
        backgroundActivityDescription.text = "Enabling background activity will allow your device to stay connected to the peer-to-peer network even if your device falls asleep or exits the app. This will allow your phone to continue to extend the range of the network without needing the app active on your screen."
        backgroundActivityDescription.numberOfLines = 6
        
        backgroundActivityStackViewRowFull.axis = .vertical
        backgroundActivityStackViewRowTop.addArrangedSubview(backgroundActivityLabel)
        backgroundActivityStackViewRowTop.addArrangedSubview(backgroundActivityToggle)
        backgroundActivityStackViewRowFull.addArrangedSubview(backgroundActivityStackViewRowTop)
        backgroundActivityStackViewRowFull.addArrangedSubview(backgroundActivityDescription)
        
        locationSharingLabel.text = "Send Location"
        locationSharingLabel.font = UIFont.boldSystemFont(ofSize: 24)
        locationSharingDescription.text = "Enabling location sharing will allow you to share you GPS location with others in the app. If your device has a GPS built into it, it will not require cellular service or WiFi to capture your current location."
        locationSharingDescription.numberOfLines = 6
        
        locationSharingStackViewRowFull.axis = .vertical
        locationSharingStackViewRowTop.addArrangedSubview(locationSharingLabel)
        locationSharingStackViewRowTop.addArrangedSubview(locationSharingToggle)
        locationSharingStackViewRowFull.addArrangedSubview(locationSharingStackViewRowTop)
        locationSharingStackViewRowFull.addArrangedSubview(locationSharingDescription)
    
        batterySaverLabel.text = "Battery Saver"
        batterySaverLabel.font = UIFont.boldSystemFont(ofSize: 24)
        batterySaverDescription.text = "Enabling battery saver mode will make changes to your phone's settings to help to prolong the life of your battery during extended power outages. This includes things such as disabling Bluetooth and lower display brightness."
        batterySaverDescription.numberOfLines = 6
        
        batterySaverStackViewRowFull.axis = .vertical
        batterySaverStackViewRowTop.addArrangedSubview(batterySaverLabel)
        batterySaverStackViewRowTop.addArrangedSubview(batterySaverToggle)
        batterySaverStackViewRowFull.addArrangedSubview(batterySaverStackViewRowTop)
        batterySaverStackViewRowFull.addArrangedSubview(batterySaverDescription)
        
        settingsStackView.axis = .vertical
        settingsStackView.distribution = .fillProportionally
        settingsStackView.spacing = 24
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
