//
//  User.swift
//  MessageInABottle
//
//  Created by Jacob Holme on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation

struct User: Codable
{
    var firstName: String
    var lastName: String
    // var status: safetyStatus
    
    func asString() -> String {
        return firstName + " " + lastName
    }
}

