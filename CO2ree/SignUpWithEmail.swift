//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUpWithEmail: UIViewController {
    var userDataManager = UserDataManager()
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    @IBOutlet weak var provinceInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var repasswordInput: UITextField!
    var height:CGFloat?
    var width:CGFloat?
    
    var Jenny: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view, typically from a nib.
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [Color().get(0x9AEC5B).CGColor, Color().get(0x5EBF4F).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.width!, height: self.height!)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
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
    
    
    @IBAction func submitSignup(sender: AnyObject) {

        if((firstNameInput.text == "") || (lastNameInput.text == "") || (countryInput.text == "") || (provinceInput.text == "") || (passwordInput.text == "")) {
            let alertController = UIAlertController(title: "Please fill out all fields", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if((firstNameInput.text == "First Name") || (lastNameInput.text == "Last Name") || (countryInput.text == "Country") || (provinceInput.text == "Province / State") || (passwordInput.text == "Password")) {
            let alertController = UIAlertController(title: "Please fill out all fields", message:
            "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if (isValidEmail(emailInput.text) == false) {
            let alertController = UIAlertController(title: "You typed an invalid email address", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if (passwordInput.text != repasswordInput.text) {
            let alertController = UIAlertController(title: "Passwords don't match", message:
                "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            var app = UIApplication.sharedApplication().delegate as AppDelegate
            app.user = User(firstName: firstNameInput.text, lastName: lastNameInput.text, email: emailInput.text, country:countryInput.text, province:provinceInput.text, password:passwordInput.text)
            
            RESTClient.post("http://code.shawnjung.ca/user",
                data: [
                    "first_name": firstNameInput.text,
                    "last_name": lastNameInput.text,
                    "email": emailInput.text,
                    "country_code": countryInput.text,
                    "subregion_code": provinceInput.text,
                    "password": passwordInput.text,
                    "password_confirmation": passwordInput.text,
                    
                ],
                success: { data, response in
                    // store session token
                    println(data)
                    app.user.token = data["session_token"] as? String
                    app.user.isLogOut = false
                    self.userDataManager.addNewUser(app.user)
                    self.userDataManager.save()
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
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        if let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx) {
            return emailTest.evaluateWithObject(testStr)
        }
        return false
    }
    
}