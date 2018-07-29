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
        request(URLs.scoreList, method: .post , parameters: ["params":[["condition":"EQUAL","key": "organizationID","value": organizationID]],"ticket" : App.loginRes?.ticket ?? "" ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[ScoreListRes]>>) in
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
        request(URLs.giftList, method: .post , parameters: ["ticket" : App.loginRes?.ticket ?? "" ,"params":[["condition":"EQUAL","key": "organizationID" ,"value": organizationID]] , "pageNo" : 1 , "pageSize" : 10 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GiftListRes]>>) in
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
        request(URLs.getLevel, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetLevelRes>>) in
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
    
    
    
    static func editProfile(vc : UIViewController ,lastName : String!, birthdate : String!, address : String!, secondChildBD : String!, latitude : String!, sex : String!, firstChildBD : String!, nationalId : String!, firstName : String!, phoneNumber : String!, email : String!, anniversary : String!  , longitude : String! ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<LoginRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.editProfile, method: .post , parameters: EditProfileUserRequestModel.init(lastName: lastName, birthdate: birthdate, address: address, secondChildBD: secondChildBD, latitude: latitude, sex: sex, firstChildBD: firstChildBD, nationalId: nationalId, firstName: firstName, phoneNumber: phoneNumber, email: email, anniversary: anniversary, longitude: longitude).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func like(vc : UIViewController , rowId : CLongLong ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<CLongLong>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.like, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? "" , "liked":1,"rewardConversionFormula":["rowId": rowId],"rowId": 0 ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    static func dislike(vc : UIViewController , rowId : CLongLong ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<String>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.disLike, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? "" ,"rowId": rowId ], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<String>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func saveComment(vc : UIViewController , txt : String , rowId : CLongLong  , subject : CommentsSubject,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<CLongLong>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.saveComment, method: .post , parameters: SendCommentRequestModel.init(txt: txt, rowID: rowId, subject: subject).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
   
    
    
    static func getHistoryOfClub(vc : UIViewController , organizationId : String,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GetHistoryOfClubRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getHistoryOfClub, method: .post , parameters: GetHistoryActivityClubRequestModel.init(organizationId: organizationId).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GetHistoryOfClubRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func getUserQRCode(vc : UIViewController,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetQRCodeRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getUserQRCode, method: .post , parameters: ["ticket" : App.loginRes?.ticket!], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetQRCodeRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func SendContacts(vc : UIViewController, contacts : [[String : Any]] , _ withLoading : Bool = true , completionHandler: @escaping (String?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        
        guard let URL = URL(string: URLs.sendContactList) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"
        
        // Headers
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        // JSON Body
        
        let bodyObject = contacts
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if(withLoading){l!.disView()}
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                completionHandler("success")
            } else {
                // Failure
                completionHandler("error")
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
        
        
    }
    
    
    static func getAllContact(vc : UIViewController,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GetAllContactRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        print(GetAllContactListRequestModel.init().getParams())
        request(URLs.getAllContacts, method: .post , parameters: GetAllContactListRequestModel.init().getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GetAllContactRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func searchInContacts(vc : UIViewController ,txt : String ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GetAllContactRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        print(GetAllContactListRequestModel.init().getParams())
        request(URLs.getAllContacts, method: .post , parameters: SearchInContactsRequestModel.init(txt : txt).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GetAllContactRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    
    static func getInvitationCode(vc : UIViewController ,_ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetInvitationCodeRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getInvitationCode, method: .post , parameters: ["ticket" : App.loginRes?.ticket! ?? ""], encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetInvitationCodeRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    
    static func getPolls(vc : UIViewController ,organizationID : String , _ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<[GetPollRes]>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getPolls, method: .post , parameters: GetPollsRequestModel.init(organizationRowID: organizationID).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<[GetPollRes]>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
    static func getDetailPolls(vc : UIViewController ,scenarioID : String , _ withLoading : Bool = true , completionHandler: @escaping (ResponseModel<GetInvitationCodeRes>?) -> Void){
        
        var l : LoadingViewController? = nil
        if(withLoading){l = App.showLoading(vc: vc)}
        request(URLs.getDetailPoll, method: .post , parameters: GetDetailPollRequestModel.init(scenarioID: scenarioID).getParams(), encoding: JSONEncoding.default).responseDecodableObject(decoder: App.decoder) { (response : DataResponse<ResponseModel<GetInvitationCodeRes>>) in
            if(withLoading){l!.disView()}
            resHandler(vc , res: response.result.value){ res in
                completionHandler(res)
            }
            
        }
        
    }
    
    
}




























