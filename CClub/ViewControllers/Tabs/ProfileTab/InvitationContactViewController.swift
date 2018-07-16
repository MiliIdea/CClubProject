//
//  InvitationContactViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/14/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class InvitationContactViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    
    @IBOutlet var searchBox: DCBorderedTextField!
    
    @IBOutlet var contactTable: UITableView!
    
    var invitationCode : String = ""
    
    var secureContacts : [GetAllContactRes] = [GetAllContactRes]()
    
    var allContacts : [GetAllContactRes] = [GetAllContactRes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBox.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        contactTable.delegate = self
        contactTable.dataSource = self
        self.contactTable.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier:"ContactTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if((textField.text?.count)! >= 3){
            MyRequests.searchInContacts(vc: self, txt: textField.text!){res in
                if(res != nil && res?.result != nil && (res?.result?.count)! > 0){
                    self.allContacts = (res?.result)!
                    self.contactTable.reloadData()
                }
            }
        }else if((textField.text?.count)! == 0){
            self.allContacts = self.secureContacts
            self.contactTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allContacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ContactTableViewCell = contactTable.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath as IndexPath) as! ContactTableViewCell
        let c = allContacts[indexPath.row]
        if(c.isMember)!{
            cell.cclubImage.alpha = 1
            cell.inviteButton.alpha = 0
        }else{
            cell.cclubImage.alpha = 0
            cell.inviteButton.alpha = 1
        }
        cell.name.text = c.firstName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 * self.view.frame.height / 667
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // text to share
        
        if(!self.allContacts[indexPath.row].isMember!){
            let text = " : کد دعوت به سی کلاب " + self.invitationCode
            
            // set up activity view controller
            let textToShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            
            // exclude some activity types from the list (optional)
            activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
            
            // present the view controller
            self.present(activityViewController, animated: true, completion: nil)
        }
    }

}














