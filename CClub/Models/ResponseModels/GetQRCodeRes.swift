//
//  getQRCodeRes.swift
//  CClub
//
//  Created by MehrYasan on 7/9/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
struct GetQRCodeRes : Codable {
    
    let ccardNumber : String?
    
    enum CodingKeys: String, CodingKey {
        
        case ccardNumber = "ccardNumber"

    }
    
    
}
