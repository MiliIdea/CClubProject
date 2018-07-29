//
//  SaveChangeNotificationRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"getNotification":true,"organizationRowId":100097,"ticket":"t09195651255|3923490470857175"}

class SaveChangeNotificationRequestModel{
    
    init(organizationRowId : CLongLong! , getNotify : Bool!) {
        
        param = ["getNotification":getNotify ,"organizationRowId":organizationRowId,"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}


