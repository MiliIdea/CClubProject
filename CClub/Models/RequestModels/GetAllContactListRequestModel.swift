//
//  GetAllContactListRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
//{"pageNo":1,"params":[{"condition":"EQUAL","key":"personId","value":"100023712"}],"ticket":"t09195651255|3923490470857175"}
class GetAllContactListRequestModel{
    
    init() {
        
        param = [ "pageNo":1 , "pageSize":10000 ,"params":[["condition":"EQUAL","key":"personId","value":(App.loginRes?.personId?.description)!]],"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
