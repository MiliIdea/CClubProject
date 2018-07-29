//
//  SettingsViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/4/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit


class SettingsViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet var notifyTable: UITableView!
    
    @IBOutlet var scroller: UIScrollView!
    @IBOutlet var supportView: DCBorderedView!
    @IBOutlet var profileSettingsView: UIView!
    
    
    
    
    var notifysSettings : [GetNotificationRes] = [GetNotificationRes]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateScroller()
        self.notifyTable.delegate = self
        self.notifyTable.dataSource = self
        self.notifyTable.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier:"NotificationTableViewCell")
        self.notifyTable.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func contactUs(_ sender: Any) {
        
        let vC : ContactViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ContactViewController"))! as! ContactViewController
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func conditions(_ sender: Any) {
        
    }
    
    @IBAction func logout(_ sender: Any) {
        App.defaults.set(nil, forKey: DefaultStrings.loginRes)
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "RegisterViewController")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func calculateScroller(){
        
        var scrollerHeight : CGFloat = 0.0
        scrollerHeight = self.profileSettingsView.frame.height
        scrollerHeight += self.supportView.frame.height
        scrollerHeight += (70 / 667 * self.view.frame.height) * CGFloat(self.notifysSettings.count)
        scrollerHeight += self.notifyTable.frame.origin.y
        
        self.notifyTable.frame.size.height = (70 / 667 * self.view.frame.height) * CGFloat(self.notifysSettings.count)
        self.supportView.frame.origin.y = self.notifyTable.frame.size.height + self.notifyTable.frame.origin.y
        self.profileSettingsView.frame.origin.y = self.supportView.frame.size.height + self.supportView.frame.origin.y
        self.scroller.contentSize.height = scrollerHeight
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NotificationTableViewCell = notifyTable.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath as IndexPath) as! NotificationTableViewCell
        let c = self.notifysSettings[indexPath.row]
        cell.clubName.text = c.organizationName
        cell.switchNotify.isOn = c.getNotification!
        cell.switchNotify.tag = indexPath.row + 1
        cell.switchNotify.addTarget(self, action: #selector(self.pressButton(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func pressButton(_ sender: UISwitch){
        
        MyRequests.saveNotificationSettings(vc: self, organizationRowID: self.notifysSettings[((sender ).tag - 1)].organizationRowId!, getNotify: sender.isOn){ res in
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 / 667 * self.view.frame.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifysSettings.count
    }
    
    
    

}
