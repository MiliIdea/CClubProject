//
//  GetInvitationCodeRes.swift
//  CClub
//
//  Created by MehrYasan on 7/15/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

struct GetInvitationCodeRes : Codable {
    
    let fisrt : String?
    
    let second : String?
    
    enum CodingKeys: String, CodingKey {
        
        case fisrt = "1000"
        
        case second = "100042"
        
    }
    
    
}
