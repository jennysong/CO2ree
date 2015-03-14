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

    
    var categoryName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTitle.title = categoryName
        

        //graph
        categoryGraph.image = UIImage(named: "\(categoryName)Graph.jpg")
            
            
            //UIImage( name: String,
//        inBundle bundle: NSBundle?,
  //      compatibleWithTraitCollection traitCollection: UITraitCollection?
        
        
        
        
        //list
        
        
        
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

