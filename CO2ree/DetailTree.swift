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
    var height:CGFloat?
    var width:CGFloat?
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    var treeNameValue: String?
    var treeImageValue: String?
    var statusValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [Color().get(0x9AEC5B).CGColor, Color().get(0x5EBF4F).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        navigationItem.title = treeNameValue
        //self.treeName.text = treeNameValue
        self.treeImage.image = UIImage(named: treeImageValue!)
        //self.myImage.frame = CGRectMake(40,30,self.myImage.frame.width*0.5,self.myImage.frame.height*0.5)
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
