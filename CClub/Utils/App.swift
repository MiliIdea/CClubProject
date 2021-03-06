//
//  App.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import UIKit
import UIColor_Hex_Swift
import ContactsUI

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
    
    static var getProfileRes : GetProfileRes?
    
    static var getLevelRes : GetLevelRes?
    
    
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
       
        let vC : UIViewController = (this.storyboard?.instantiateViewController(withIdentifier: id))! 
        this.navigationController?.pushViewController(vC, animated: true)
    }
    
    
    static func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width : size.width * heightRatio,height : size.height * heightRatio)
        } else {
            newSize = CGSize(width : size.width * widthRatio, height : size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x : 0, y : 0,width : newSize.width,height : newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    static let type_submit_bye_cod : Int = 1000
    static let type_survey : Int = 1002
    static let type_send_data : Int = 1003
    static let type_invite : Int = 1004
    static let type_add_club : Int = 1005
    static let type_store_cclub : Int = 1006
    static let type_sharj : Int = 1007
    static let type_profile : Int = 1008
    
    static func getScoreIcon(id : Int) -> String{
        switch id {
        case type_submit_bye_cod:
            return ""
        case type_survey:
            return ""
        case type_send_data:
            return ""
        case type_invite:
            return ""
        case type_add_club:
            return ""
        case type_store_cclub:
            return ""
        case type_sharj:
            return ""
        case type_profile:
            return ""
        default:
            return ""
        }
    }
    
    static func getScoreColor(id : Int) -> UIColor{
        switch id {
        case type_submit_bye_cod:
            return UIColor("#94C550")
        case type_survey:
            return UIColor("#46CE9C")
        case type_send_data:
            return UIColor("#D046A6")
        case type_invite:
            return UIColor("#4673D0")
        case type_add_club:
            return UIColor("#FFA60C")
        case type_store_cclub:
            return UIColor("#F03838")
        case type_sharj:
            return UIColor("#20ACBD")
        case type_profile:
            return UIColor("#868686")
        default:
            return UIColor.white
        }
        
    }
    
    
    
    
    static func load(URL: URL , completionHandler: @escaping (UIImage) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with : request, completionHandler: { (data: Data!, response: URLResponse!, error: Error!) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                // This is your file-variable:
                // data
                completionHandler(UIImage(data:data,scale:1.0)!)
            }else {
                // Failure
            }
        })
        task.resume()
    }
    
    static func compressImage(image:UIImage) -> Data? {
        // Reducing file size to a 10th
        
        var actualHeight : CGFloat = image.size.height
        var actualWidth : CGFloat = image.size.width
        var maxHeight : CGFloat = 1136.0
        var maxWidth : CGFloat = 640.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        var maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.5
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if(imgRatio > maxRatio){
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else{
                actualHeight = maxHeight;
                actualWidth = maxWidth;
                compressionQuality = 1;
            }
        }
        
        var rect = CGRect.init(x : 0.0,y: 0.0,width: actualWidth,height: actualHeight);
        UIGraphicsBeginImageContext(rect.size);
        image.draw(in: rect)
        var img = UIGraphicsGetImageFromCurrentImageContext();
        let imageData = UIImageJPEGRepresentation(img!, compressionQuality);
        UIGraphicsEndImageContext();
        
        return imageData
    }
    
    
    static func getContacts() -> [CNContact] { //  ContactsFilter is Enum find it below
        
        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers") // you can use print()
        }
        
        var results: [CNContact] = []
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)
            } catch {
                print("Error fetching containers")
            }
        }
        return results
    }
    
    
    static func phoneNumberWithContryCode() -> [String] {
        
        let contacts = App.getContacts() // here calling the getContacts methods
        var arrPhoneNumbers = [String]()
        for contact in contacts {
            for ContctNumVar: CNLabeledValue in contact.phoneNumbers {
                if let fulMobNumVar  = ContctNumVar.value as? CNPhoneNumber {
                    //let countryCode = fulMobNumVar.value(forKey: "countryCode") get country code
                    if let MccNamVar = fulMobNumVar.value(forKey: "digits") as? String {
                        arrPhoneNumbers.append(MccNamVar)
                    }
                }
            }
        }
        return arrPhoneNumbers // here array has all contact numbers.
    }
    
    static func phoneNumberWithName() -> [String : String] {
        
        let contacts = App.getContacts() // here calling the getContacts methods
        var arrPhoneNumbers = [String : String]()
        for contact in contacts {
            for ContctNumVar: CNLabeledValue in contact.phoneNumbers {
                if let fulMobNumVar  = ContctNumVar.value as? CNPhoneNumber {
                    //let countryCode = fulMobNumVar.value(forKey: "countryCode") get country code
                    if let MccNamVar = fulMobNumVar.value(forKey: "digits") as? String {
                        let s = contact.givenName + contact.familyName
                        arrPhoneNumbers[s] = MccNamVar
                    }
                }
            }
        }
        return arrPhoneNumbers // here array has all contact numbers.
    }
    
}



















