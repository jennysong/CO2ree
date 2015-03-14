//
//  ViewController.swift
//  CO2ree
//
//  Created by Jenny Song on 2015-03-13.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class TasksWithCategories: UIViewController {
    



    @IBOutlet weak var categoryTitle: UINavigationItem!
    @IBOutlet weak var categoryGraph: UIImageView!
    @IBOutlet weak var tasksByCategory: UITableView!
    
    var categoryName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTitle.title = categoryName
        

        //graph
        categoryGraph.image = UIImage(named: "\(categoryName)Graph.jpg")
        
        //list       
        
        var myArr:NSObject = ["one","two","three","four","five"]
        
//        tasksByCategory.insertSections(1, withRowAnimation: 1)
        /*
        for index in 0...28 {
            if TaskLibrary().library[index][2] == categoryName {
                    println(TaskLibrary().library[index][0])
                
            }
        }*/
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        /*if segue.identifier == "backToTasks" {
            let tasksController = segue.destinationViewController as Tasks
        }*/
    }


    
}

