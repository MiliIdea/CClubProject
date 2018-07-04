//
//  ViewController.swift
//  CClub
//
//  Created by MehrYasan on 5/13/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Toast_Swift

class RegisterViewController : UIViewController {

    
    @IBOutlet var phoneNumber: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(App.loginRes != nil && App.loginRes?.ticket != nil){
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTabBarController")
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func requestForActivationCode(_ sender: Any) {
        
        MyRequests.register(vc: self, phone: phoneNumber.text!){ res in

            let vC : LoginViewController = (self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController"))! as! LoginViewController
            vC.phoneNumber = self.phoneNumber.text!
            self.navigationController?.pushViewController(vC, animated: true)
            
        }
        
    }
    
    @IBAction func loginAsGuest(_ sender: Any) {
        
        MyRequests.loginAsAGuest(vc: self){ res in
            do {
                let data = try JSONEncoder().encode(res?.result)
                App.defaults.set(data, forKey: DefaultStrings.loginRes)
            } catch {
                print(error)
            }
            App.defaults.set(true, forKey: DefaultStrings.isItGuest)
            let appDelegate = UIApplication.shared.delegate! as! AppDelegate
            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTabBarController")
            appDelegate.window?.rootViewController = initialViewController
            appDelegate.window?.makeKeyAndVisible()
        }
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
         self.view.endEditing(true)
    }
}



/*
 
 let vC : FirstMapViewController = (self.storyboard?.instantiateViewController(withIdentifier: "FirstMapViewController"))! as! FirstMapViewController
 self.navigationController?.pushViewController(vC, animated: true)
 
 
 App.push(this: self, id: "MainPageViewController")
 */
