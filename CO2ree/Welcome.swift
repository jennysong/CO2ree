//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Welcome: UIViewController {
    var userDataManager = UserDataManager()
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = userDataManager.get()
        userDataManager.addNewUser(self.user!)
        userDataManager.save()
/*        var app = UIApplication.sharedApplication().delegate as AppDelegate
        nameLabel.text = app.user.firstName
        // Do any additional setup after loading the view, typically from a nib.
*/
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}