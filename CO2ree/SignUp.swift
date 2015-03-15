//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUp: UIViewController, FBLoginViewDelegate {
    
    var facebookID: String!
    var firstName: String!
    var lastName: String!
    var email: String!
    @IBOutlet var fbLoginView : FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToSignUpWithEmail" {
            let signUpWithEmailController = segue.destinationViewController as SignUpWithEmail
        }
        else if segue.identifier == "goTosignUpWithFB" {
            let SignUpWithFBController = segue.destinationViewController as SignUpWithFB
        }
    }
    
    
    @IBAction func signUpWithEmail(sender: AnyObject) {
            performSegueWithIdentifier("goToSignUpWithEmail", sender: sender)
    }
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        facebookID = user.objectID
        firstName = user.first_name
        lastName = user.last_name
        var userEmail = user.objectForKey("email") as String
        email = userEmail
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
        
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}