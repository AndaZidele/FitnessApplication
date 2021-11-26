//
//  PreviousDays.swift
//  FitnessApplication
//
//  Created by anda.zidele on 26/11/2021.
//

import Foundation


struct PreviousDays{
    let textO: String
    let textT: String
    
    static func createData() -> [PreviousDays]{
        var prevD: [PreviousDays] = []
        
        for index in 0...4{
            let p = PreviousDays(textO: "vvv", textT: "vvv")
            prevD.append(p)
        }
        
        return prevD
    }
    
    
    
}
