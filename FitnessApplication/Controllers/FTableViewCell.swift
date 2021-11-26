//
//  FTableViewCell.swift
//  FitnessApplication
//
//  Created by anda.zidele on 23/11/2021.
//

import UIKit

class FTableViewCell: UITableViewCell {

    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var firstName: UILabel!
    
    var activityF: activityFile!
    
    @IBOutlet weak var fCellLabel: UILabel!
    
    var fCell: Int = 1
    
    //var activityFilesSFood = activityFileSecond.createCell()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        if activityF != nil{
            firstImage.image = UIImage(named: activityF.sport)
            firstName.text = activityF.activityName
            fCellLabel.text = "1"
            
        }
        //print(fCellLabel)
    }
    

    /*private func myFunc() -> Int{
        return 2
    }*/
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       /* let mainigais = self.firstName
        print(mainigais?.text)
        */
       // fCellLabel.text = "1"
        
        if self.firstName.text == "FOOD"{
           // fCell = myFunc()
            fCellLabel.text = "2"
            print("jaaaa")
        }
        //fCellLabel.text = "2"
        
        // Configure the view for the selected state
      /*  if fCell == 1 {
            activityFilesSFood = activityFileSecond.createCellFood()
            //SecondTableViewController().activityFilesS = activityFileSecond.createCell()
        //activityFilesS = activityFileSecond.createCell()
       // var activityFilesSFood = activityFileSecond.createCellFood()
        
        }*/
    }

}
