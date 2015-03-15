//
//  Score.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-14.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class User {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var facebookID: String?
    var country: String?
    var province: String?
    var password: String?
    var score: Double?
    
    init(firstName: String, lastName: String, email: String, country: String, province: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.facebookID = ""
        self.country = country
        self.province = province
        self.password = password
        self.score = 0.0
    }
    
    init(firstName: String, lastName: String, email: String, facebookID: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.facebookID = facebookID
        var country = ""
        var province = ""
        var password = ""
        var score: Double = 0.0
    }
    
    
    
}
