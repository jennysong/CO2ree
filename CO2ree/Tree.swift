//
//  Tree.swift
//  CO2ree
//
//  Created by Younsuk Oh on 3/14/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class Tree{
    var name = "Tree"
    var imageName = "tree.png"
    //status: 0 ~ 1
    var status = 0.0
    init(name: String, imageName: String,status: Double){
        self.name = name
        self.imageName = imageName
        self.status = status
    }
}