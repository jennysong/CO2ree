//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUpWithFB: UIViewController {
    
    @IBOutlet var countryField: UITextField!
    @IBOutlet var provinceField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var repasswordField: UITextField!
    var facebookID = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToWelcome" {
            let welcomeController = segue.destinationViewController as Welcome
        }
    }
    
    @IBAction func submitAction(sender: AnyObject) {
        if((countryField.text == "") || (provinceField.text == "") || (passwordField.text == "") || (repasswordField.text == "")) {
            let alertController = UIAlertController(title: "Please fill out all fields", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if((countryField.text == "Country") || (provinceField.text == "Province / State") || (passwordField.text == "Password")) {
            let alertController = UIAlertController(title: "Please fill out all fields", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if (passwordField.text != repasswordField.text) {
            let alertController = UIAlertController(title: "Passwords don't match", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            println("here")
            var app = UIApplication.sharedApplication().delegate as AppDelegate
            app.user = User(firstName: self.firstName, lastName: self.lastName, email: self.email, country:countryField.text, province:provinceField.text, password:passwordField.text, facebookID: self.facebookID)
            

            
            RESTClient.post("http://code.shawnjung.ca/user",
                data: [
                    "first_name": self.firstName,
                    "last_name": self.lastName,
                    "email": self.email,
                    "country_code": countryField.text,
                    "subregion_code": provinceField.text,
                    "password": passwordField.text,
                    "password_confirmation": passwordField.text,
                    "faceboo_id": self.facebookID
                ],
                success: { data, response in
                    // store session token
                    self.performSegueWithIdentifier("goToWelcome", sender: self)
                },
                error: { data, response in
                    var message:String = data["error"] as String
                    let alertController = UIAlertController(title: "Validation Error", message:
                        message, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)

                    
                }
            )
            
            
            /*(url: String, data: NSDictionary? = nil, headers: NSDictionary? = nil, var before: ((NSMutableURLRequest) -> Void)? = nil, var complete: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var success: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var error: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil)*/
            
            
        }

    }
    
}