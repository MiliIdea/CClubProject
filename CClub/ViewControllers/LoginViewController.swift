//
//  LoginViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var topDescription: UILabel!
    
    @IBOutlet var activationCode: UITextField!
    
    @IBOutlet var invitationCode: UITextField!
    
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
        

        MyRequests.login(vc: self, phone: phoneNumber, code: invitationCode.text!){ res in

            if(res?.done)!{
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
