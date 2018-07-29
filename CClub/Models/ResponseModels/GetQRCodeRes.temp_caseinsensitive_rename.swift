//
//  getQRCodeRes.swift
//  CClub
//
//  Created by MehrYasan on 7/9/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
struct GetQRCodeRes : Codable {
    let time : String?
    let credit : CLongLong?
    let point : CLongLong?
    let price : CLongLong?
    let rewardName : String?
    let tansactionMasterId : CLongLong?
    
    enum CodingKeys: String, CodingKey {
        
        case time = "time"
        case credit = "credit"
        case point = "point"
        case price = "price"
        case rewardName = "rewardName"
        case tansactionMasterId = "tansactionMasterId"
    }
    
    
}
