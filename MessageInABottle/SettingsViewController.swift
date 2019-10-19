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
    var backgroundStackViewRowTop = UIStackView()
    var backgroundStackViewRowFull = UIStackView()
    
    var locationSharingLabel = UILabel()
    var locationSharingDescription = UILabel()
    var locationSharingToggle = UISwitch()
    var locationStackViewRowTop = UIStackView()
    var locationStackViewRowFull = UIStackView()
    
    var batterySaverLabel = UILabel()
    var batterySaverDescription = UILabel()
    var batterySaverToggle = UISwitch()
    var batterySaverStackViewRowTop = UIStackView()
    var batterySaverStackViewRowFull = UIStackView()
    
    var settingsStackView = UIStackView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    
        
        // Do any additional setup after loading the view.
    }
}
