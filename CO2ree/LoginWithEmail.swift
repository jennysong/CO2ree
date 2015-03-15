//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class LoginWithEmail: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
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
    
    @IBAction func signIn(sender: AnyObject) {
        RESTClient.post("http://code.shawnjung.ca/session",
            data: [
                "email": emailField.text,
                "password": passwordField.text
            ],
            success: { data, response in
                println(data)
                let app = UIApplication.sharedApplication().delegate as AppDelegate
                app.user = User(firstName: data["first_name"] as String, lastName: data["last_name"] as String, email: data["email"] as String, country: data["country_code"] as String, province: data["subregion_code"] as String, password: "")
                app.user.token = data["session_token"] as? String
                
                self.performSegueWithIdentifier("goToWelcome", sender: self)

                
            },
            error: { data, response in
                let alertController = UIAlertController(title: "Login Failed", message:
                    "Please check your email and password.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)

            }
        )

        
    }
}