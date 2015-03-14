//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class SignUpWithEmail: UIViewController {
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var countryInput: UITextField!
    @IBOutlet weak var provinceInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var repasswordInput: UITextField!
    
    var Jenny: User!
    
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
            Jenny = User(firstName: firstNameInput.text, lastName: lastNameInput.text, email: emailInput.text)
            Jenny.country = countryInput.text
            Jenny.province = provinceInput.text
            Jenny.password = passwordInput.text
            
            performSegueWithIdentifier("goToWelcome", sender: sender)
   
            
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