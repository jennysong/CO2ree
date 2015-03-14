//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Tasks: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToTasksTransportation" {
            let tasksTransportation = segue.destinationViewController as TasksByCategory
            tasksTransportation.categoryName = "Transportation"
        }
        if segue.identifier == "goToTasksHome" {
            let tasksHome = segue.destinationViewController as TasksByCategory
            tasksHome.categoryName = "Home"
        }
        if segue.identifier == "goToTasksFood" {
            let tasksFood = segue.destinationViewController as TasksByCategory
            tasksFood.categoryName = "Food"
        }
        if segue.identifier == "goToTasksSchool" {
            let tasksSchool = segue.destinationViewController as TasksByCategory
            tasksSchool.categoryName = "School"
        }
    }
    
    
    @IBAction func transportationAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTasksTransportation", sender: sender)
    }
    
    @IBAction func homeAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTasksHome", sender: sender)
    }
    
    @IBAction func FoodAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTasksFood", sender: sender)
    }
    
    @IBAction func SchoolAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTasksSchool", sender: sender)
    }
    
    
}

