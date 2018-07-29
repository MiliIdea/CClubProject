//
//  GetInfoClubRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
//{"rowId":1000,"ticket":"t09195651255|3923490470857175"}

class GetInfoClubRequestModel{
    
    init(rowID : CLongLong!) {
        
        param = ["rowId":rowID ,"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
