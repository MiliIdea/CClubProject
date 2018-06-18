//
//  EditProfileUserRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"lastName":"soltaniyyyyyy","birthdate":"1371/04/13","address":"test","ticket":"t09195651255|3923490470857175","secondChildBD":"1397/03/05","latitude":"35.69394167244651","sex":"0","userName":"09195651255","firstChildBD":"1397/03/05","rowId":"100070578","firstName":"sajad","phoneNumber":"02133333333","nationalId":"0015312097","email":"test@yahoo.com","anniversary":"1397/03/05","longitude":"51.378953866660595"}

class EditProfileUserRequestModel{
    
    init(lastName : String!, birthdate : String!, address : String!, secondChildBD : String!, latitude : String!, sex : String!, firstChildBD : String!, nationalId : String!, firstName : String!, phoneNumber : String!, email : String!, anniversary : String!  , longitude : String!) {
        
        self.param = ["lastName":lastName,"birthdate":birthdate,"address":address,"ticket":(App.loginRes?.ticket!)!,"secondChildBD":secondChildBD,"latitude":latitude,"sex":sex,"userName":(App.loginRes?.username!)!,"firstChildBD":firstChildBD,"rowId":(App.loginRes?.userId?.description)!,"firstName":firstName,"phoneNumber":phoneNumber,"nationalId":nationalId,"email":email,"anniversary":anniversary,"longitude":longitude]
        
    }
    
    var param : [String : Any]?
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
