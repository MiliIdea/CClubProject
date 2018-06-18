//
//  RegisterRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import UIKit

//{"deviceId":"4f940cc2-840f-404a-af7e-9c831e0038c3","phone":"09354541751"}
class RegisterRequestModel {
    
    init(phone : String!) {

        self.deviceId = App.uuid
        
        self.phone = phone
        
    }
    
    var deviceId: String!
    
    var phone: String!
    
    
    func getParams() -> [String: Any]{
        
        return ["deviceId": deviceId!  , "phone": phone!]
        
    }
    
}
