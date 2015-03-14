//
//  ViewController.swift
//  CO2ree 
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Home: UIViewController {
    var userFirstTime: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        if userFirstTime {
            self.performSegueWithIdentifier("goToLogIn", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToLogIn" {
            let signUpController = segue.destinationViewController as LogIn
        }
    }
    
    @IBAction func goToGarden(sender: AnyObject) {
        performSegueWithIdentifier("goToGardenFromHome", sender: sender)
    }
}

