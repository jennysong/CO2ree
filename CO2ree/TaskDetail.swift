//
//  TaskDetail.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-14.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class TaskDetail: UIViewController {
    var selectedTask = ""
    
    @IBOutlet weak var taskName: UINavigationItem!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var projectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.title = selectedTask
        taskLabel.text = selectedTask
        
        //
        var app = UIApplication.sharedApplication().delegate as AppDelegate
        let current = app.user.score!
        println(current)
        //
        currentLabel.text = "\(current)kg"
        
        for index in 1...28 {
            if TaskLibrary().library[index][0] == selectedTask {
                taskDescription.text = TaskLibrary().library[index][1]
                projectedLabel.text = "\(current + (TaskLibrary().library[index][3] as NSString).doubleValue)kg"
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iDidItButton(sender: AnyObject) {
        let alertController = UIAlertController(title: "Are you sure?", message:
            "", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}