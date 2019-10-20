//
//  SettingsViewController.swift
//  MessageInABottle
//
//  Created by Joshua Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import UIKit

class BatteryTipsViewController: UIViewController
{
    
    var batterySaverLabel = UILabel()
    var batterySaverDescription = UILabel()
    var dismissButton = UIButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 189.0/255.0, green: 189.0/255.0, blue: 189.0/255.0, alpha: 1.0)
    
        batterySaverLabel.text = "Tips To Save On Battery:"
        batterySaverLabel.font = UIFont.boldSystemFont(ofSize: 24)
        batterySaverDescription.text = "Lowering your screen brightness will help to stretch your battery life further. Enabling Low Power Mode in Settings will make changes to your phone to help to prolong the life of your battery. This is ideal during emergency situations as you may not have an opportunity to charge up your devices. In addition to Low Power Mode, you also should think about turning off Bluetooth, as Bluetooth is also known to lower battery life. NOTE: YOU SHOULD KEEP CELLULAR TURNED ON IN THE EVENT THAT SERVICE IS RESTORED AND YOU ARE ABLE TO CALL EMERGENCY SERVICES."
        batterySaverDescription.numberOfLines = 50
        
        dismissButton.setTitle("Sounds good!", for: .normal)
        dismissButton.backgroundColor = UIColor(red: 69.0/255.0, green: 228.0/255.0, blue: 119.0/255.0, alpha: 1.0)
        dismissButton.layer.cornerRadius = 15
        dismissButton.layer.borderWidth = 5
        dismissButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        dismissButton.setTitleColor(.black, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)

        view.addSubview(batterySaverLabel)
        view.addSubview(batterySaverDescription)
        view.addSubview(dismissButton)
        
        batterySaverLabel.translatesAutoresizingMaskIntoConstraints = false
        batterySaverDescription.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            batterySaverLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            batterySaverLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            batterySaverLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            batterySaverLabel.heightAnchor.constraint(equalToConstant: 24),
            
            batterySaverDescription.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            batterySaverDescription.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            batterySaverDescription.topAnchor.constraint(equalTo: batterySaverLabel.layoutMarginsGuide.bottomAnchor),
            batterySaverDescription.heightAnchor.constraint(equalToConstant: 300),
            
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: batterySaverDescription.bottomAnchor, constant: 50),
            dismissButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            dismissButton.heightAnchor.constraint(equalToConstant: view.frame.width / 9)
            
        ])
       
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
