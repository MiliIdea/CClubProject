//
//  giftListRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
//{"pageNo":1,"pageSize":10,"ticket":"t09195651255|3923490470857175"}
class GetListRequestModel{
    
    init(pageNo : Int) {
        
        self.ticket = App.loginRes?.ticket
        
        self.pageNo = pageNo
        
    }
    
    var pageNo: Int!
    
    var pageSize: Int! = 100
    
    var ticket : String!
    
    func getParams() -> [String: Any]{
        
        return ["ticket": ticket!  , "pageSize": pageSize! , "pageNo" : pageNo!]
        
    }
    
}
