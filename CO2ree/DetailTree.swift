//
//  DetailTree.swift
//  CO2ree
//
//  Created by Younsuk Oh on 3/14/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class DetailTree: UIViewController {
    //@IBOutlet weak var treeName: UILabel!

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    var treeNameValue: String?
    var treeImageValue: String?
    var statusValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.treeName.text = treeNameValue
        self.treeImage.image = UIImage(named: treeImageValue!)
        if(statusValue >= 1){
            self.status.text = "Complete"
        } else {
            self.status.text = "\(statusValue!*100)%"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
