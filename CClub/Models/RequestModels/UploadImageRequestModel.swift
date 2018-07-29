//
//  UploadImageRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 7/8/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class UploadImageRequestModel{
    
    init(imageCode : String) {
        
        self.param = ["ticket":(App.loginRes?.ticket!)!,"userName":(App.loginRes?.username!)!,"rowId":(App.loginRes?.userId?.description)!,"imageCode":imageCode]
        
    }
    
    var param : [String : Any]?
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
