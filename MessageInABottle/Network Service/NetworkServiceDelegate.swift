//
//  NetworkServiceDelegate.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation

protocol NetworkServiceDelegate {
    
    func connectedDevicesChanged(manager: NetworkService, connectedDevice: [String])
    
    func receivedMessage(manager: NetworkService, message: Message)
}
