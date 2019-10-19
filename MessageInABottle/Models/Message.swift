//
//  Message.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation

struct Message: Codable {
    var user: User
    var message: String
    var timestamp: String
}
