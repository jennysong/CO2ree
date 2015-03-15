//
//  MasterViewController.swift
//  test
//
//  Created by Jenny Song on 2015-03-14.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class TasksByCategory: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet var taskTable: UITableView!
    @IBOutlet weak var categoryTitle: UINavigationItem!
    @IBOutlet weak var categoryGraph: UIImageView!
    var categoryName = ""
    var items: [String] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        categoryTitle.title = categoryName
        self.taskTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //graph
        var randNum: Int = 0
        
        if categoryName == "Transportation"{
        randNum = Int(arc4random()) % 5 + 1
        categoryGraph.image = UIImage(named: "transportation\(randNum).jpg")
        }
        
        else if categoryName == "School"{
        randNum = Int(arc4random()) % 4 + 1
        categoryGraph.image = UIImage(named: "office\(randNum).jpg")
        }
        
        else if categoryName == "Home" {
        randNum = Int(arc4random()) % 4 + 1
        categoryGraph.image = UIImage(named: "home\(randNum).jpg")
        }
        else if categoryName == "Food" {
        randNum = Int(arc4random()) % 5 + 1
        categoryGraph.image = UIImage(named: "food\(randNum).jpg")
        }
       
        
        for index in 0...28 {
            if TaskLibrary().library[index][2] == categoryName {
                items.append(TaskLibrary().library[index][0])
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToTasksDetail" {
                let taskDetailController = segue.destinationViewController as TaskDetail
                if let indexPath = self.tableView.indexPathForSelectedRow() {
                    taskDetailController.selectedTask = items[indexPath.row]
                }
            }
        
    }
    
}








