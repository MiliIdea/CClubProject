//
//  PermissionPopupViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/7/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit
import CoreLocation

class PermissionPopupViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet var backPopup: UIView!
    @IBOutlet var popupView: DCBorderedView!
    @IBOutlet var titleOfPopup: UILabel!
    @IBOutlet var descOfPopup: UILabel!
    
    var locManager: CLLocationManager!
    var timer : Timer = Timer.init()
    var isItLocationPermission : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager = CLLocationManager()
        locManager.delegate = self
        
        if(isItLocationPermission){
            titleOfPopup.text = "دسترسی به موقعیت یابی"
            descOfPopup.text = "برای تکمیل پروفایل و ثبت موقعیت جغرافیایی خود به این دسترسی نیاز می باشد"
        }else{
            titleOfPopup.text = "دسترسی به دفترچه تلفن"
            descOfPopup.text = "برای ارسال دعوت به دوستانتان نیاز به دسترسی دفترچه تلفن شما می باشد."
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes(_ sender: Any) {
        if(isItLocationPermission){
            if CLLocationManager.locationServicesEnabled() {
                switch CLLocationManager.authorizationStatus() {
                case .notDetermined:
                    locManager.requestAlwaysAuthorization()
                    timer = Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(check), userInfo: nil, repeats: true)
                    break
                case .restricted, .denied:
                    print("No access")
                    self.goSettings()
                    self.view.removeFromSuperview()
                    self.removeFromParentViewController()
                    break
                case .authorizedAlways, .authorizedWhenInUse:
                    print("Access")
                    
                    let vC : EditProfileViewController = (self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController"))! as! EditProfileViewController
                    self.navigationController?.pushViewController(vC, animated: true)
                    self.view.removeFromSuperview()
                    self.removeFromParentViewController()
                    break
                }
            } else {
                print("Location services are not enabled")
                self.goSettings()
            }
        }else{
            
        }
    }
    
    @IBAction func no(_ sender: Any) {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
    
    @objc func check(){
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                break
            case .restricted, .denied:
                print("No access")
                timer.invalidate()
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
                self.goSettings()
                break
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                timer.invalidate()
                let vC : EditProfileViewController = (self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController"))! as! EditProfileViewController
                self.navigationController?.pushViewController(vC, animated: true)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
                break
            }
        } else {
            print("Location services are not enabled")
            
        }
    }


    func goSettings(){
        let alertController = UIAlertController (title: "دسترسی موقعیت مکانی", message: "آیا به تنظیمات می روید؟", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "تنظیمات", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "بستن", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            manager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            let vC : EditProfileViewController = (self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController"))! as! EditProfileViewController
            self.navigationController?.pushViewController(vC, animated: true)
            break
        case .authorizedAlways:
            // If always authorized
            let vC : EditProfileViewController = (self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController"))! as! EditProfileViewController
            self.navigationController?.pushViewController(vC, animated: true)
            break
        case .restricted:
            // If restricted by e.g. parental controls. User can't enable Location Services
            self.goSettings()
            break
        case .denied:
            // If user denied your app access to Location Services, but can grant access from Settings.app
            self.goSettings()
            break
            
        }
    }
    
    
}
