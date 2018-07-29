//
//  LikeRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"liked":1,"rewardConversionFormula":{"rowId":100011},"rowId":0,"ticket":"t09195651255|3923490470857175"}

class GiftLikeRequestModel{
    
    init(giftRowID : CLongLong!) {
        
        param = ["liked":1,"rewardConversionFormula":["rowId":giftRowID],"rowId":0,"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
