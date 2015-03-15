//
//  CustomCell.swift
//  CO2ree
//
//  Created by Younsuk Oh on 3/14/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(tree: Tree){
        self.myLabel.text = tree.name
        /*
        self.myImage.image = UIImage(named: tree.imageName)
        
        // this is to get white image to green
        self.myImage.image = self.myImage.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.myImage.tintColor = Color().get(0x9AEC5B)
        self.myImage.frame = CGRectMake(40,30,self.myImage.frame.width*0.5,self.myImage.frame.height*0.5)
        */
        
    }

}
