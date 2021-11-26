//
//  AllFoodTableViewCell.swift
//  FitnessApplication
//
//  Created by anda.zidele on 25/11/2021.
//

import UIKit

class AllFoodTableViewCell: UITableViewCell {
    
    
    var activityFS: activityFileSecondForFood!

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imgFood: UIImageView!
    
    //var activityFS: activityFileSecondForFood!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if activityFS != nil{
            label.text = activityFS.nameS
            imgFood.image = UIImage(named: activityFS.imageS)
            
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
