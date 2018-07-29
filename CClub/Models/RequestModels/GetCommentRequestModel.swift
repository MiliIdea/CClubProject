//
//  GetCommecntRequestModel.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
//{"pageNo":1,"params":[{"condition":"EQUAL","key":"useCase.rowId","value":"100091"},{"condition":"EQUAL","key":"subjectId","value":"100011"}],"ticket":"t09195651255|3923490470857175"}

class GetCommentRequestModel{
    
    init(rowID : String! , subject : CommentsSubject! , pageNum : Int! , pageSize : Int!) {
        var subjectS : String = ""
        
        switch subject {
        case .CAMPAIN:
            subjectS = "1000147"
            break
        case .REWARD:
            subjectS = "100091"
            break
        case .NEWS:
            subjectS = "1000155"
            break
        default:
            subjectS = "1000147"
        }

        param = [ "pageNo":pageNum , "pageSize":pageSize ,"params":[["condition":"EQUAL","key":"useCase.rowId","value":subjectS],["condition":"EQUAL","key":"subjectId","value":rowID]],"ticket":(App.loginRes?.ticket)!]
        
    }
    
    var param : [String : Any]?
    
    
    func getParams() -> [String: Any]{
        
        return param!
        
    }
    
}
