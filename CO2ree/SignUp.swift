//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUp: UIViewController, FBLoginViewDelegate {
    var userDataManager = UserDataManager()
    
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
        else if segue.identifier == "goToSignUpWithFB" {
            let SignUpWithFBController = segue.destinationViewController as SignUpWithFB
            SignUpWithFBController.firstName = firstName
            SignUpWithFBController.lastName = lastName
            SignUpWithFBController.email = email
            SignUpWithFBController.facebookID = facebookID
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
        self.fbLoginView.delegate = nil
        facebookID = user.objectID
        firstName = user.first_name
        lastName = user.last_name
        var userEmail = user.objectForKey("email") as String
        email = userEmail
        
        RESTClient.post("http://code.shawnjung.ca/session/facebook",
            data: [ "facebook_id": facebookID ],
            success: { data, response in
                let app = UIApplication.sharedApplication().delegate as AppDelegate
                app.user = User(firstName: data["first_name"] as String, lastName: data["last_name"] as String, email: data["email"] as String, country: data["country_code"] as String, province: data["subregion_code"] as String, password: "")
                app.user.token = data["session_token"] as? String
                app.user.isLogOut = false
                self.userDataManager.addNewUser(app.user)
                self.userDataManager.save()
                self.performSegueWithIdentifier("goToWelcome", sender: self)
            },
            error: { data, response in
                self.performSegueWithIdentifier("goToSignUpWithFB", sender: self)
            }
        )
        
        
        
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