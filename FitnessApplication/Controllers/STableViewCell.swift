//
//  STableViewCell.swift
//  FitnessApplication
//
//  Created by anda.zidele on 23/11/2021.
//

import UIKit

class STableViewCell: UITableViewCell {

    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var lostKcal: UILabel!
    
    var activityFS: activityFileSecond!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if activityFS != nil{
            secondImage.image = UIImage(named: activityFS.imageS)
            secondName.text = activityFS.nameS
            lostKcal.text = activityFS.kcalS
            
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
