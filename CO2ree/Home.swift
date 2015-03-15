//
//  ViewController.swift
//  CO2ree 
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Home: UIViewController {
    var height:CGFloat?
    var width:CGFloat?
    @IBOutlet weak var homeTreeImage: UIImageView!
    @IBOutlet weak var treeNameLabel: UILabel!
    
    @IBOutlet weak var treeDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor =  UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color().get(0x5EBF4F)]
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [Color().get(0x9AEC5B).CGColor, Color().get(0x5EBF4F).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        homeTreeImage.image = UIImage(named: "gittree-white.png")
        homeTreeImage.frame = CGRectMake(0,0,self.width!*0.6,self.height!*0.5)
        homeTreeImage.center = self.view.center
        homeTreeImage.frame.origin = CGPoint(x:self.width!*0.19, y: self.height!*0.23)
        treeNameLabel.text = "Git Tree"
        treeNameLabel.textColor = UIColor.whiteColor()
        treeNameLabel.frame.origin = CGPoint(x:self.width!*0.11, y: self.height!*0.13)
        treeDescription.text = "You saved 89kg\n of carbon emissions to date"
        treeDescription.textColor = UIColor.whiteColor()
        treeDescription.frame.origin = CGPoint(x:self.width!*0.01, y: self.height!*0.75)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /*if segue.identifier == "goToTasks" {
            let tasksController = segue.destinationViewController as Tasks
        }*/
        if segue.identifier == "goToTaskFromHome" {
            let gardenController = segue.destinationViewController as Garden
        }
        if segue.identifier == "goToLogIn" {
            let signUpController = segue.destinationViewController as LogIn
        }
    }
}