//
//  GiftDeleteLikeRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"ticket":"t09195651255|3923490470857175","rowId":"100011"}

class GiftDeleteLikeRequestModel{
    
    init(giftRowID : CLongLong!) {
        
        param = ["rowId": (giftRowID.description),"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
