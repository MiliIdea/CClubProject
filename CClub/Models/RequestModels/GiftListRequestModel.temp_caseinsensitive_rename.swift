//
//  giftListRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

// {"pageNo":1,"pageSize":10,"ticket":"t09195651255|3923490470857175"}
class SetNotificationIDRequestModel {
    
    init() {
        
        self.ticket = App.loginRes?.ticket
        
        self.notificationId = App.notificationID
        
    }
    
    var ticket: String!
    
    var notificationId: String!
    
    
    func getParams() -> [String: Any]{
        
        return ["ticket": ticket!  , "notificationId": notificationId!]
        
    }
    
}
