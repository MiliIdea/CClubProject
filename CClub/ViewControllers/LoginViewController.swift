//
//  LoginViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import UICheckbox_Swift

class LoginViewController: UIViewController {

    @IBOutlet var topDescription: UILabel!
    
    @IBOutlet var activationCode: UITextField!
    
    @IBOutlet var invitationCode: UITextField!
    
    @IBOutlet var acceptTerms: UICheckbox!
    
    
    var phoneNumber : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToEditPhoneNumber(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func terms(_ sender: Any) {
        UIApplication.shared.open(URL.init(string: URLs.terms)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func activation(_ sender: Any) {
        
        if(!self.acceptTerms.isSelected){
            self.view.makeToast("برای ورود نیاز به قبول قوانین می باشد")
            return
        }
        MyRequests.login(vc: self, phone: phoneNumber, code: invitationCode.text!){ res in

            
            if(res != nil && (res?.done)!){
                do {
                    let data = try JSONEncoder().encode(res?.result)
                    App.defaults.set(data, forKey: DefaultStrings.loginRes)
                } catch {
                    print(error)
                }
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTabBarController")
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
            }
            
        }
        
    }
    
    @IBAction func resendCode(_ sender: Any) {
        MyRequests.resendCode(vc: self, phone: phoneNumber){ res in
            self.view.makeToast("کد فعالسازی ارسال شد")
        }
    }
    

}
