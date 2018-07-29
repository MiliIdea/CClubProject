//
//  EditProfileUserRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class EditProfileUserRequestModel{
    
    init(lastName : String!, birthdate : String!, address : String!, secondChildBD : String!, latitude : String!, sex : String!, firstChildBD : String!, nationalId : String!, firstName : String!, phoneNumber : String!, email : String!, anniversary : String!  , longitude : String!) {
        
        self.param = ["lastName":lastName,"birthdate":birthdate,"address":address,"ticket":(App.loginRes?.ticket!)!,"secondChildBD":secondChildBD,"latitude":latitude,"sex":sex,"userName":(App.loginRes?.username!)!,"firstChildBD":firstChildBD,"rowId":(App.loginRes?.userId?.description)!,"firstName":firstName,"phoneNumber":phoneNumber,"nationalId":nationalId,"email":email,"anniversary":anniversary,"longitude":longitude]
        
    }
    
    var param : [String : Any]?
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
