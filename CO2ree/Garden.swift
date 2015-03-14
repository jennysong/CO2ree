//
//  Garden.swift
//  CO2ree
//
//  Created by Younsuk Oh on 3/13/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class Garden: UITableViewController {
    var trees = ["Pine Tree", "Tree", "Git Tree"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trees.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCellWithIdentifier("gardenCell", forIndexPath: indexPath) as MyCustomCell
        myCell.labelCell.text = trees[indexPath.row]
        
        return myCell
        
        
    }
    
}

