//
//  ViewController.swift
//  CO2ree 
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToTasks" {
            let taskController = segue.destinationViewController as Tasks
        }
        if segue.identifier == "goToTree" {
            let treeController = segue.destinationViewController as Tree
        }
        if segue.identifier == "goToStandings" {
            let standingController = segue.destinationViewController as Standings
        }
        if segue.identifier == "goToProfile" {
            let profileController = segue.destinationViewController as Profile
        }
        if segue.identifier == "goToAbout" {
            let aboutController = segue.destinationViewController as About
        }
        
        
    }
    
    @IBAction func taskAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTasks", sender: sender)
    }
    
    @IBAction func treeAction(sender: AnyObject) {
        performSegueWithIdentifier("goToTree", sender: sender)
    }
    
    @IBAction func standingsAction(sender: AnyObject) {
        performSegueWithIdentifier("goToStandings", sender: sender)
    }
    
    @IBAction func profileAction(sender: AnyObject) {
        performSegueWithIdentifier("goToProfile", sender: sender)
    }
    
    @IBAction func aboutUsAction(sender: AnyObject) {
        performSegueWithIdentifier("goToAbout", sender: sender)
    }
    
    
}

