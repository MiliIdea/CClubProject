//
//  SearchInContactsRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 7/16/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class SearchInContactsRequestModel{
    
    init(txt : String) {
        
        let num = CLongLong(txt)
        if(num != nil){
            param = [ "pageNo":1 , "pageSize":10000 ,"params":[["condition":"CONTAINS","key":"phone","value":txt]],"ticket":(App.loginRes?.ticket)!]
        }else{
            param = [ "pageNo":1 , "pageSize":10000 ,"params":[["condition":"CONTAINS","key":"fullTitle","value":txt]],"ticket":(App.loginRes?.ticket)!]
        }
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
