//
//  Score.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-14.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class User : NSObject, NSCoding {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var facebookID: String?
    var country: String?
    var province: String?
    var password: String?
    var score: Double?
    var token: String?
    var isLogOut: Bool = true
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(email, forKey: "email")
        aCoder.encodeObject(facebookID, forKey: "facebookID")
        aCoder.encodeObject(country, forKey: "country")
        aCoder.encodeObject(province, forKey: "province")
        aCoder.encodeObject(score, forKey: "score")
        aCoder.encodeObject(token, forKey: "token")
        aCoder.encodeObject(isLogOut, forKey: "isLogOut")
    }
    required init(coder aDecoder: NSCoder) {
        firstName = aDecoder.decodeObjectForKey("firstName") as String?
        lastName = aDecoder.decodeObjectForKey("lastName") as String?
        email = aDecoder.decodeObjectForKey("email") as String?
        facebookID = aDecoder.decodeObjectForKey("facebookID") as String?
        country = aDecoder.decodeObjectForKey("country") as String?
        province = aDecoder.decodeObjectForKey("province") as String?
        score = aDecoder.decodeObjectForKey("score") as Double?
        token = aDecoder.decodeObjectForKey("token") as String?
        isLogOut = aDecoder.decodeObjectForKey("isLogOut") as Bool
        
    }
    
    init(firstName: String, lastName: String, email: String, country: String, province: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.facebookID = nil
        self.country = country
        self.province = province
        self.password = password
        self.score = 0.0
    }
    
    init(firstName: String, lastName: String, email: String, country: String, province: String, password: String, facebookID: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.country = country
        self.province = province
        self.password = password
        self.facebookID = facebookID
        self.score = 0.0
    }
    
    
    
}
