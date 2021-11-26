//
//  activityFileSecond.swift
//  FitnessApplication
//
//  Created by anda.zidele on 24/11/2021.
//

import Foundation


struct activityFileSecond{
    let imageS: String
    let nameS: String
    let kcalS: String
    
    static func createCell() -> [activityFileSecond]{
        var activityFilesSecond: [activityFileSecond] = []
        
        //print(FTableViewCell().fCell)
        
        let imgs = Data.shared.imgSecond
        let names = Data.shared.nameSecond
        let kc = Data.shared.kcalSecond
        
            for index in 0..<imgs.count{
                let img = activityFileSecond(imageS: imgs[index], nameS: names[index], kcalS: kc[index])
        
                activityFilesSecond.append(img)
            }
        
        return activityFilesSecond
    }
    
    /*
   static func createCellFood() -> [activityFileSecond]{
        var activityFilesSecond: [activityFileSecond] = []
        let imgs = Data.shared.imgSecondFood
        let names = Data.shared.nameSecondFood
       let kc = Data.shared.kcalSecondFood
        
        for index in 0..<imgs.count{
            let img = activityFileSecond(imageS: imgs[index], nameS: names[index], kcalS: kc[index])
            activityFilesSecond.append(img)
        }
        
        return activityFilesSecond
    }*/
    
}
