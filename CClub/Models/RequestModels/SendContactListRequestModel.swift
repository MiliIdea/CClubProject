//
//  SendContactListRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class SendContactListRequestModel{
    
    init(firstName : String! , phone : String!) {
        
        param = [
            "firstName": firstName,
            "personId": (App.loginRes?.personId?.description)!,
            "phone": phone,
            "rowId": 0,
            "sourcePhone": (App.loginRes?.username)!,
            "ticket": (App.loginRes?.ticket)!
        ]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}

