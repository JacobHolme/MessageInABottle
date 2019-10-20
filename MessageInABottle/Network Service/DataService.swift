//
//  DataService.swift
//  MessageInABottle
//
//  Created by Sam DuBois on 10/19/19.
//  Copyright © 2019 Holme. All rights reserved.
//

import Foundation

class DataService {
    
    static var firstName: String? {
        get {
            return UserDefaults.standard.string(forKey: "firstName") as String?
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: "firstName")
        }
    }
    
    static var lastName: String? {
        get {
            return UserDefaults.standard.string(forKey: "lastName") as String?
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: "lastName")
        }
    }
    
    static var isLoggedIn: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn") as Bool?
        }
        
        set {
            return UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }
    }
    
    
}
