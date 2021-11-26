//
//  FoodTableViewCell.swift
//  FitnessApplication
//
//  Created by anda.zidele on 25/11/2021.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    var activityFS: activityFileSecondForFood!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if activityFS != nil {
            foodImg.image = UIImage(named: activityFS.imageS)
            foodName.text = activityFS.nameS
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
