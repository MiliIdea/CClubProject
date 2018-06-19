//
//  App.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import UIKit

public class App {
    
    static let defaults: UserDefaults = UserDefaults.standard
    
    static let uuid : String = UIDevice.current.identifierForVendor!.uuidString
    
    static var giftList : [GiftListRes] = [GiftListRes]()
    static var scoreList : [ScoreListRes] = [ScoreListRes]()
    static var myClubs : [MyClubsRes] = [MyClubsRes]()
    
    static var decoder : JSONDecoder {
        get{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            return decoder
        }
    }
    
    static var loginRes : LoginRes? {
        get{
            do{
                if(App.defaults.object(forKey: DefaultStrings.loginRes) != nil){
                    return try JSONDecoder().decode(LoginRes.self, from: App.defaults.object(forKey: DefaultStrings.loginRes) as! Data)
                }else{
                    return nil
                }
            }catch{
                print(error)
                return nil
            }
        }
    }
    
    //TODO : set id from onesignal
    static let notificationID : String = ""
    
    static func showLoading(vc : UIViewController) -> LoadingViewController{
        let loadingView : LoadingViewController = (vc.storyboard?.instantiateViewController(withIdentifier: "LoadingViewController"))! as! LoadingViewController
        vc.addChildViewController(loadingView)
        loadingView.view.frame = vc.view.frame
        vc.view.addSubview(loadingView.view)
        loadingView.didMove(toParentViewController: vc)
        return loadingView
    }
    
    static func push (this : UIViewController! , id : String!){
       
        let vC : UIViewController = (this.storyboard?.instantiateViewController(withIdentifier: id))! as! UIViewController
        this.navigationController?.pushViewController(vC, animated: true)
    }
    
    
}



















