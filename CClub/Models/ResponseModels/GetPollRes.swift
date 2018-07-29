//
//  GetPollRes.swift
//  CClub
//
//  Created by MehrYasan on 7/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

struct GetPollRes : Codable {
    
    let title : String?
    
    let isDone : Bool?
    
    let scenarioId : CLongLong?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        
        case isDone = "isDone"
        
        case scenarioId = "scenarioId"
        
    }
    
    
}
