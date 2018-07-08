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
            }else if(res?.errorCode == "USER_EXPIRED"){
                App.defaults.set(nil, forKey: DefaultStrings.loginRes)
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                let initialViewController = vc.storyboard!.instantiateViewController(withIdentifier: "RegisterViewController")
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
            }else{
                vc.view.makeToast(res?.errorDesc)
                completionHandler(res)
            }
            
        }else{
            completionHandler(res)
            vc.view.makeToast(res?.errorDesc)
        }
    }
    
    
    // MARK: register
    
    static func register(vc : UIViewController , phone : String  ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        
        request(URLs.register, method: .post , parameters: RegisterRequestModel.init(phone: phone).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    // MARK: login
    
    static func login(vc : UIViewController , phone : String , code : String ,_ withLoading : Bool = true, completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){

        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.login, method: .post , parameters: LoginRequestModel.init(code: code, phone: phone).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func loginAsAGuest(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.loginAsAGuest, method: .post , parameters: ["lang":"FA","organizationId":1000,"roleId":100011,"userId":100060007,"userPassword":"28275","username":"00000000000"], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func resendCode(vc : UIViewController ,_ withLoading : Bool = true , phone : String, completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.resendCode, method: .post , parameters: ["phone" : phone], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    // MARK: MainPageRequests
    
    
    static func scoreList(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[ScoreListRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.scoreList, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[ScoreListRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func scoreListForClub(vc : UIViewController ,_ withLoading : Bool = true ,organizationID : String, completionHandler: @escaping (ResponseModel<[ScoreListRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.scoreList, method: .post , parameters: ["params":[["condition":"EQUAL","key": organizationID,"value":"1000"]],"ticket" : App.loginRes?.ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[ScoreListRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    
    
    static func newsList(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getNews, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func giftList(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GiftListRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.giftList, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GiftListRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func giftListForClub(vc : UIViewController ,_ withLoading : Bool = true , organizationID : String , completionHandler: @escaping (ResponseModel<[GiftListRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.giftList, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" ,"params":[["condition":"EQUAL","key": organizationID ,"value":"1000"]] , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GiftListRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func myClubsList(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[MyClubsRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getListOfMyClubs, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[MyClubsRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    static func getInfoClub(vc : UIViewController ,_ withLoading : Bool = true , organizationID : String , completionHandler: @escaping (ResponseModel<GetInfoClubRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getInfoClub, method: .post , parameters: ["rowId" : organizationID , "ticket" : App.loginRes?.ticket ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetInfoClubRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    static func getProfile(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetProfileRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getProfile, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetProfileRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func getLevel(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetLevelRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getProfile, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetLevelRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func getComment(vc : UIViewController , subject : String  , rowId : CommentsSubject , _ pageNum : Int = 1 , _ pageSize : Int = 100 ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[CommentRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getComment, method: .post , parameters: GetCommentRequestModel.init(rowID: subject, subject: rowId , pageNum : pageNum , pageSize : pageSize).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[CommentRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    static func getNotificationSettings(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GetNotificationRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getNotificationSettings, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GetNotificationRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func saveNotificationSettings(vc : UIViewController , organizationRowID : CLongLong , getNotify : Bool ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetNotificationRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.saveChangeNotification, method: .post , parameters: SaveChangeNotificationRequestModel.init(organizationRowId: organizationRowID, getNotify: getNotify).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetNotificationRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func saveProfileImage(vc : UIViewController , imageCode : Int ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.editProfile, method: .post , parameters: UploadImageRequestModel.init(imageCode: imageCode.description).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
}



















