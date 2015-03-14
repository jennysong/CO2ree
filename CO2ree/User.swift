//
//  Score.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-14.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class User {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var facebookID = ""
    var country = ""
    var province = ""
    var password = ""
    var score: Double = 0.0
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init(firstName: String, lastName: String, email: String, facebookID: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.facebookID = facebookID
    }
    
    
    
}
