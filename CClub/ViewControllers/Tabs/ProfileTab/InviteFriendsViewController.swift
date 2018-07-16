//
//  InviteFriendsViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/14/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class InviteFriendsViewController: UIViewController {

    @IBOutlet var invitationCode: DCBorderedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyRequests.getInvitationCode(vc: self){res in
            self.invitationCode.setTitle(res?.result?.fisrt, for: .normal)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func inviteFriend(_ sender: Any) {
        MyRequests.getAllContact(vc: self){res in
            let vC : InvitationContactViewController = (self.storyboard?.instantiateViewController(withIdentifier: "InvitationContactViewController"))! as! InvitationContactViewController
            if(res != nil && (res?.done)! && res?.result != nil && (res?.result?.count)! > 0 ){
                vC.allContacts = (res?.result)!
                vC.secureContacts = (res?.result)!
            }
            vC.invitationCode = self.invitationCode.title(for: .normal)!
            self.navigationController?.pushViewController(vC, animated: true)
            
        }
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        // text to share
        let text = " : کد دعوت به سی کلاب " + self.invitationCode.title(for: .normal)!
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func copyInvitation(_ sender: Any) {
        UIPasteboard.general.string = self.invitationCode.title(for: .normal)
        self.view.makeToast("کد دعوت شما کپی شد")
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}





































