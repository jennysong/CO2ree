//
//  UserData.swift
//  CO2ree
//
//  Created by Younsuk Oh on 3/14/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//


import Foundation


class UserData: NSObject, NSCoding {
    let user:User
    
    init(user:User) {
        self.user = user
    }
    
    required init(coder: NSCoder) {
        self.user = coder.decodeObjectForKey("user")! as User
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.user, forKey: "user")
    }

}
