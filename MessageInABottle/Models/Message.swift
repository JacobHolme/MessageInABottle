//
//  Message.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation

struct Message: Codable {
    var sender: String
    var content: String
    var timestamp: String
}
