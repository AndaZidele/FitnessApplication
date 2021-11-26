//
//  activityFile.swift
//  FitnessApplication
//
//  Created by anda.zidele on 23/11/2021.
//

import Foundation

struct activityFile {
    let sport: String
    let activityName: String
    
    static func createActivity() -> [activityFile]{
        var activityFiles: [activityFile] = []
        let activities = Data.shared.sport
        let names = Data.shared.activityName
        
        for index in 0..<activities.count {
            let activity = activityFile(sport: activities[index], activityName: names[index])
            activityFiles.append(activity)
            
        }
        return activityFiles
        
    }
    
    
    
}
