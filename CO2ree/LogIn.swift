//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class LogIn: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToLoginWithFB" {
            let loginWithFBController = segue.destinationViewController as LoginWithFB // need to change
        }
        if segue.identifier == "goToLoginWithEmail" {
            let loginWithEmailController = segue.destinationViewController as LoginWithEmail
        }
        if segue.identifier == "goToSignUp" {
            let signUpController = segue.destinationViewController as SignUp
        }
        if segue.identifier == "goToWhyNeedLogin" {
            let whyNeedLoginController = segue.destinationViewController as WhyNeedLogin
        }
    }
    
    @IBAction func loginWithFB(sender: AnyObject) {
        performSegueWithIdentifier("goToLoginWithFB", sender: sender)
    }
    
    @IBAction func loginWithEmail(sender: AnyObject) {
        performSegueWithIdentifier("goToLoginWithEmail", sender: sender)
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        performSegueWithIdentifier("goToSignUp", sender: sender)
    }
    
}

