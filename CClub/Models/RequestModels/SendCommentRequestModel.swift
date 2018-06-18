//
//  SendCommentRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"commentType":1,"content":"Salam baraye test mibashad ","rowId":0,"subjectId":100011,"ticket":"t09195651255|3923490470857175","usecase":{"rowId":100091}}


class SendCommentRequestModel{
    
    init(txt : String! , rowID : CLongLong! , subject : CommentsSubject!) {
        
        var subjectS : CLongLong = 1000147
        
        switch subject {
        case .CAMPAIN:
            subjectS = 1000147
            break
        case .REWARD:
            subjectS = 100091
            break
        case .NEWS:
            subjectS = 1000155
            break
        default:
            subjectS = 1000147
        }
        
        param = ["commentType":1,"content": txt,"rowId":0,"subjectId":rowID,"ticket":(App.loginRes?.ticket)!,"usecase":["rowId":subjectS]]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
