//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    
    @IBOutlet var loginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToSignUpWithEmail" {
            let signUpWithEmailController = segue.destinationViewController as SignUpWithEmail
        }
        else if segue.identifier == "goTosignUpWithFB" {
            let SignUpWithFBController = segue.destinationViewController as SignUpWithFB
        }
    }
    
     /*
    @IBAction func signUpWithEmail(sender: AnyObject) {
            performSegueWithIdentifier("goToSignUpWithEmail", sender: sender)
    }
    
   
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        var userEmail = user.objectForKey("email") as String
        
        var app = UIApplication.sharedApplication().delegate as AppDelegate
        app.user = User(firstName: user.first_name, lastName: user.last_name, email: userEmail, facebookID: user.objectID)
        self.performSegueWithIdentifier("goTosignUpWithFB", sender: self)
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    */

    
    
}