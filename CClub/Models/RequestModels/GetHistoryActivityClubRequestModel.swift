//
//  GetHistoryActivityClubRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"pageNo":1,"pageSize":10,"params":[{"condition":"EQUAL","key":"organizationId","value":"1000"}],"ticket":"t09195651255|3923490470857175"}

class GetHistoryActivityClubRequestModel{
    
    init(organizationId : String!) {
        
        param = ["pageNo":1,"pageSize":100,"params":[["condition":"EQUAL","key":"organizationId","value":organizationId]],"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}

