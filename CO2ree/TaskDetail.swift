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
    
//    @IBOutlet weak var taskName: UINavigationItem!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var currentLabel: UILabel!

    var app = UIApplication.sharedApplication().delegate as AppDelegate
    var futurescore: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
  //      taskName.title = selectedTask
        taskLabel.text = selectedTask
        
        //
        let current = app.user!.score!
        //
        currentLabel.text = "\(current)kg"
        
        for index in 1...28 {
            if TaskLibrary().library[index][0] == selectedTask {
                taskDescription.text = TaskLibrary().library[index][1]
                currentLabel.text = TaskLibrary().library[index][3]
                futurescore = current + (TaskLibrary().library[index][3] as NSString).doubleValue
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goBackToAction" {
            let goToActionController = segue.destinationViewController as Tasks
        }
    }

    
    @IBAction func iDidItButton(sender: AnyObject) {
        app.user!.score! = futurescore
        
        let alertController = UIAlertController(title: "Good Job!", message:
            "Your CO2 Score is now \(futurescore) kg!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
}


