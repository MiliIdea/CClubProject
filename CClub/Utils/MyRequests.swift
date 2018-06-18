//
//  MyRequests.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import CodableAlamofire
import Toast_Swift

public class MyRequests {
    
    
    // MARK: res handler
    
    static func resHandler<T>(_ vc : UIViewController , res : ResponseModel<T>? , completionHandler: @escaping (ResponseModel<T>?) -> Void){
        print(res ?? "")
        if(res != nil){
            if(res?.done)!{
                completionHandler(res)
            }else{
                vc.view.makeToast(res?.errorDesc)
            }
            
        }else{
            vc.view.makeToast(res?.errorDesc)
        }
    }
    
    
    // MARK: register
    
    static func register(vc : UIViewController , phone : String , completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        
        let l = App.showLoading(vc: vc)
        request(URLs.register, method: .post , parameters: RegisterRequestModel.init(phone: phone).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    // MARK: login
    
    static func login(vc : UIViewController , phone : String , code : String, completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){

        let l = App.showLoading(vc: vc)
        request(URLs.login, method: .post , parameters: LoginRequestModel.init(code: code, phone: phone).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func loginAsAGuest(vc : UIViewController, completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.loginAsAGuest, method: .post , parameters: ["lang":"FA","organizationId":1000,"roleId":100011,"userId":100060007,"userPassword":"28275","username":"00000000000"], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func resendCode(vc : UIViewController , phone : String, completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.resendCode, method: .post , parameters: ["phone" : phone], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    // MARK: MainPageRequests
    
    
    static func scoreList(vc : UIViewController , completionHandler: @escaping (ResponseModel<ScoreListRes>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.scoreList, method: .post , parameters: ["ticket" : (App.defaults.object(forKey: DefaultStrings.loginRes) as! LoginRes).ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<ScoreListRes>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func newsList(vc : UIViewController , completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.getNews, method: .post , parameters: ["ticket" : (App.defaults.object(forKey: DefaultStrings.loginRes) as! LoginRes).ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func giftList(vc : UIViewController , completionHandler: @escaping (ResponseModel<GiftListRes>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.giftList, method: .post , parameters: ["ticket" : (App.defaults.object(forKey: DefaultStrings.loginRes) as! LoginRes).ticket ?? "" , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GiftListRes>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func myClubsList(vc : UIViewController , completionHandler: @escaping (ResponseModel<MyClubsRes>?) -> Void){
        
        let l = App.showLoading(vc: vc)
        request(URLs.getListOfMyClubs, method: .post , parameters: ["ticket" : (App.defaults.object(forKey: DefaultStrings.loginRes) as! LoginRes).ticket! , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<MyClubsRes>>) in
            l.disView()
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}



















