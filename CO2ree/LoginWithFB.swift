//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class LoginWithFB: UIViewController, FBLoginViewDelegate {
    var userDataManager = UserDataManager()
    var facebookID: String!
    var firstName: String!
    var lastName: String!
    var email: String!
    var height:CGFloat?
    var width:CGFloat?
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [Color().get(0x9AEC5B).CGColor, Color().get(0x5EBF4F).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.width!, height: self.height!)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        self.fbLoginView.delegate = nil
        
        println("User: \(user.objectID)")
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
                self.performSegueWithIdentifier("goToFBSignup", sender: self)
            }
        )
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
        
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToFBSignup" {
            let SignUpWithFBController = segue.destinationViewController as SignUpWithFB
            SignUpWithFBController.firstName = firstName
            SignUpWithFBController.lastName = lastName
            SignUpWithFBController.email = email
            SignUpWithFBController.facebookID = facebookID
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}