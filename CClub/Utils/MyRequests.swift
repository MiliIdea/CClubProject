//
//  MyRequests.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

public class MyRequests {
    
    static func login(vc : ViewController , completionHandler: @escaping (ResponseModel<String>?) -> Void){
    
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: vc)
        
        request(URLs.login, method: .post , parameters: [:] , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<String>>) in
            
            let res = response.result.value
            print(res ?? "")
            l.disView()
            completionHandler(res)
            
        }
        
    }
    
}
