//
//  GetPollsRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 7/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class GetPollsRequestModel{
   
    init(organizationRowID : String) {
        
        param = ["params":[["condition":"EQUAL","key":"organization.rowId","value":organizationRowID]],"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
