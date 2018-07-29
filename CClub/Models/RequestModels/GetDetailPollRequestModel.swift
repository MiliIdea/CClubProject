//
//  GetDetailPollRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 7/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class GetDetailPollRequestModel{
    
    init(scenarioID : String) {
        
        param = ["scenarioId" : scenarioID ,"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
