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
    @IBOutlet weak var task: UIView!
    
    var items: [String] = ["We", "Heart", "Swift"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.taskTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func taskTable(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func taskTable(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func taskTable(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }
    
}
    

    
    

