//
//  activityFileSecondForFood.swift
//  FitnessApplication
//
//  Created by anda.zidele on 25/11/2021.
//

import Foundation

struct activityFileSecondForFood{
    let imageS: String
    let nameS: String
    let kcal: String
    let prot: String
    let carbs: String
    let fat: String
    
    
    //let kcalS: String
    
   static func createCellFood() -> [activityFileSecondForFood]{
        var activityFilesSecondForFood: [activityFileSecondForFood] = []
        let imgs = Data.shared.imgSecondFood
        let names = Data.shared.nameSecondFood
       let kc = Data.shared.kcalSecondFood
       let pr = Data.shared.proteinFood
       let carb = Data.shared.carbohidFood
       let fa = Data.shared.fatFood
      // let kc = Data.shared.kcalSecondFood
        
        for index in 0..<imgs.count{
            let img = activityFileSecondForFood(imageS: imgs[index], nameS: names[index], kcal: kc[index], prot: pr[index], carbs: carb[index], fat: fa[index])
            activityFilesSecondForFood.append(img)
        }
        
        return activityFilesSecondForFood
    }
    
}
