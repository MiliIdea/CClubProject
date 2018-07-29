//
//  ProfileViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Toast_Swift
import IGRPhotoTweaks
import Gallery
import Alamofire
import CodableAlamofire
import ContactsUI

class ProfileViewController: UIViewController ,GalleryControllerDelegate , IGRPhotoTweakViewControllerDelegate{

    
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var signUpDateLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var phoneNumber: UILabel!
    
    var cropVC = IGRPhotoTweakViewController()
    
    
    var p : Bool = false
    var lr : Bool = false
    var l : LoadingViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callDatas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editProfile(_ sender: Any) {
        if(!((UIApplication.shared.delegate as? AppDelegate)?.hasLocPermission())!){
            let vC : PermissionPopupViewController = (self.storyboard?.instantiateViewController(withIdentifier: "PermissionPopupViewController"))! as! PermissionPopupViewController
            vC.isItLocationPermission = true
            addChildViewController(vC)
            vC.view.frame = self.view.frame
            self.view.addSubview(vC.view)
            vC.didMove(toParentViewController: self)
            
        }else{
            let vC : EditProfileViewController = (self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController"))! as! EditProfileViewController
            self.navigationController?.pushViewController(vC, animated: true)
        }
    }
    
    @IBAction func editImage(_ sender: Any) {
        let gallery = GalleryController()
        gallery.delegate = self
        
        Config.Camera.recordLocation = false
        Config.tabsToShow = [.imageTab , .cameraTab]
        present(gallery, animated: true, completion: nil)
    }
    
    @IBAction func goTakeQRCode(_ sender: Any) {
        let vC : QRViewController = (self.storyboard?.instantiateViewController(withIdentifier: "QRViewController"))! as! QRViewController
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    
    
    @IBAction func addFriend(_ sender: Any) {
        
        if(!App.defaults.bool(forKey: DefaultStrings.isSendedContacts)){
            
            var contacts : [[String : Any]] = [[String : Any]]()
            print(App.phoneNumberWithName())
            print()
            for i in App.phoneNumberWithName() {
                contacts.append(SendContactListRequestModel.init(firstName: i.key, phone: i.value).getParams())
            }
            
            MyRequests.SendContacts(vc: self, contacts: contacts){res in
                DispatchQueue.main.async {
                    App.defaults.set(contacts, forKey: DefaultStrings.contacts)
                    App.defaults.set(true, forKey: DefaultStrings.isSendedContacts)
                    let vC : InviteFriendsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "InviteFriendsViewController"))! as! InviteFriendsViewController
                    self.navigationController?.pushViewController(vC, animated: true)
                }
            }
            
        }else{
            let vC : InviteFriendsViewController = (self.storyboard?.instantiateViewController(withIdentifier: "InviteFriendsViewController"))! as! InviteFriendsViewController
            self.navigationController?.pushViewController(vC, animated: true)
        }
        
    }
    
    
    func callDatas(){
        l = App.showLoading(vc: self)
        MyRequests.getProfile(vc: self, false){res in
            if(res != nil){
                if(res?.done)!{
                    App.getProfileRes = res?.result!
                }else{
                    self.view.makeToast(res?.errorDesc)
                }
            }
            self.p = true
            self.disLoading()
        }
        
        MyRequests.getLevel(vc: self, false){res in
            if(res != nil){
                if(res?.done)!{
                    App.getLevelRes = res?.result!
                }else{
                    self.view.makeToast(res?.errorDesc)
                }
            }
            self.lr = true
            self.disLoading()
        }
    }
    
    func disLoading(){
        if(p && lr){
            
            l?.disView()
            
            var s : String = URLs.imageServer + (App.getProfileRes?.file?.path ?? "").replacingOccurrences(of: "\\", with: "-")
            
            self.profileImage.kf.setImage(with: URL.init(string: s))
            
            self.nameLabel.text = App.getProfileRes?.fullName
            
            self.phoneNumber.text = App.getProfileRes?.mobile
            
            self.signUpDateLabel.text = App.getLevelRes?.fromDate
            
        }
    }
    
    
    
    
    
    func galleryControllerDidCancel(_ controller: GalleryController) {
        print("cancel")
        controller.dismiss(animated: true, completion: nil)
    }
    
    func galleryController(_ controller: GalleryController, didSelectImages images: [Gallery.Image]) {
        controller.dismiss(animated: true, completion: nil)
        print("select image")
        
        images[0].resolve{ image in
            let cropViewController = IGRPhotoTweakViewController()
            cropViewController.image = image
            cropViewController.delegate = self
            self.cropVC.delegate = self
            cropViewController.setCropAspectRect(aspect: "200:200")
            cropViewController.lockAspectRatio(true)
            let button = UIButton(type: .system) // let preferred over var here
            button.frame = CGRect.init(x: self.view.frame.width - 110, y: self.view.frame.height - 110, width: 100, height: 100)
            button.layer.cornerRadius = 50
            button.backgroundColor = UIColor.white
            button.setTitle("", for: .normal)
            button.setBackgroundImage(UIImage.init(named: "Groupe 1484"), for: .normal)
            button.tag = 777
            button.addTarget(self, action: #selector(self.cropAction), for: UIControlEvents.touchUpInside)
            cropViewController.view.addSubview(button)
            self.cropVC = cropViewController
            self.tabBarController?.selectedIndex = 0
            self.present(self.cropVC, animated: true, completion: nil)
        }
        
    }
    
    @objc func cropAction(){
        self.cropVC.cropAction()
    }
    
    func galleryController(_ controller: GalleryController, requestLightbox images: [Gallery.Image]) {
        print("request light box")
    }
    
    func galleryController(_ controller: GalleryController, didSelectVideo video: Video) {
        print("select video")
        
    }
    
    
    
    func photoTweaksController(_ controller: IGRPhotoTweakViewController, didFinishWithCroppedImage croppedImage: UIImage) {
        
        let l = App.showLoading(vc: self)
        var parameters = Dictionary<String , String>()
        let title : String = Date().timeIntervalSince1970.description + (App.loginRes?.username?.description)!
        parameters = ["ticket":(App.loginRes?.ticket!)! , "title" : title , "size" : "file-" + title + "-size"]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            if  let imageData = App.compressImage(image: croppedImage) {
                multipartFormData.append(imageData, withName: "submit", fileName: Date().timeIntervalSince1970.description + ".png", mimeType: "image/png")
            }
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
            
        }, to: URLs.saveImage , method : .post , headers : parameters)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                upload.responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[Int]>>) in
                    
                    l.disView()
                    let res = response.result.value
                    
                    if(res?.done)!{
                        
                        print(res?.result)
                        
                        MyRequests.saveProfileImage(vc: self, imageCode: (res?.result![0])!){ res2 in
                            if(res2 != nil && (res2?.done)!){
                                self.profileImage.image = croppedImage
                            }
                            controller.dismiss(animated: true, completion: nil)
                            
                        }
                        
                    }
                    
                }
                
            case .failure(let encodingError):
                print(encodingError)
                controller.dismiss(animated: true, completion: nil)
            
            }
            
        }
        
    }
    
    func photoTweaksControllerDidCancel(_ controller: IGRPhotoTweakViewController) {
        controller.dismiss(animated: true, completion: nil)
        self.tabBarController?.selectedIndex = 0
    }
    

}
