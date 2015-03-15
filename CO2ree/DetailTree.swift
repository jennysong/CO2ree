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
    var user: User!
    var userDataManager = UserDataManager()
    @IBOutlet weak var status: UILabel!
    var treeNameValue: String?
    var treeImageValue: String?
    var statusValue: Double?
    var imagesize: Character?
    @IBOutlet weak var treeNameLabel: UILabel!
    @IBOutlet weak var treeImage1: UIImageView!
    @IBOutlet weak var treeImage2: UIImageView!
    @IBOutlet weak var treeImage3: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor =  UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color().get(0x5EBF4F)]
        user = userDataManager.get()
        if user != nil {
            userDataManager.addNewUser(user)
            userDataManager.save()
        }
        height = self.view.frame.size.height
        width = self.view.frame.size.width
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [Color().get(0x9AEC5B).CGColor, Color().get(0x5EBF4F).CGColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        navigationItem.title = "Personal Tree"
        self.treeNameLabel.text = treeNameValue!
        self.treeNameLabel.textColor = UIColor.whiteColor()
        self.treeNameLabel.frame.origin = CGPoint(x:self.width!*0.11, y: self.height!*0.13)

        var i = 0;
        var s = Array(self.treeImageValue!)
        var j = s.count
        for cha in self.treeImageValue!{
            if(i == j-5){
                imagesize = cha
            }
            i++
        }
        
        if(imagesize == "a"){
            self.treeImage1.image = UIImage(named: treeImageValue!)
            statusValue = 0.3
        }else if(imagesize == "b"){
            self.treeImage2.image = UIImage(named: treeImageValue!)
            statusValue = 0.7
        } else if(imagesize == "c"){
            self.treeImage3.image = UIImage(named: treeImageValue!)
            statusValue = 1
        }
        
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
    func whichTree(){
        var trees = ["Plain Tree","Pine Tree","Money Tree","Snoopy Tree","Binary Tree","Git Tree"]
        var treeImages = ["plain-a.png","plain-b.png","plain-c.png","pine-a.png","pine-b.png","pine-c.png","money-a.png","money-b.png","money-c.png","snoopy-a.png","snoopy-b.png","snoopy-c.png","binary-a.png","binary-b.png","binary-c.png","git-a.png","git-b.png","git-c.png"]
        treeNameLabel.text = trees[Int(user!.score!/30)]
        let result = user!.score!/30 % 3
        if(result == 0){
            treeImage1.image = UIImage(named: treeImages[Int(user!.score!/30)])
        } else if (result == 1){
            treeImage2.image = UIImage(named: treeImages[Int(user!.score!/30)])
        } else {
            treeImage3.image = UIImage(named: treeImages[Int(user!.score!/30)])
            
        }
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
