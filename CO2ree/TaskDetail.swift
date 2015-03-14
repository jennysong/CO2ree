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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.title = selectedTask
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}