//
//  EditProfileViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/7/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit
import MapKit
import UICheckbox_Swift

class EditProfileViewController: UIViewController {

    @IBOutlet var topNavigationLabel: UILabel!
    
    //third page
    @IBOutlet var finalView: UIView!
    @IBOutlet var scoreYekanLabel: UILabel!
    @IBOutlet var scoreDahganLabel: UILabel!
    @IBOutlet var invitationCodeButton: DCBorderedButton!
    
    //second page
    @IBOutlet var locationView: UIView!
    @IBOutlet var map: MKMapView!
    
    //firstPage
    @IBOutlet var firstViewScroller: UIScrollView!
    @IBOutlet var viewInScroller: UIView!
    @IBOutlet var name: DCBorderedTextField!
    @IBOutlet var familyName: DCBorderedTextField!
    @IBOutlet var tel: DCBorderedTextField!
    @IBOutlet var address: DCBorderedTextField!
    @IBOutlet var email: DCBorderedTextField!
    @IBOutlet var nationalCode: DCBorderedTextField!
    @IBOutlet var birthdate: DCBorderedTextField!
    @IBOutlet var singleCheckbox: UICheckbox!
    @IBOutlet var marriedCheckbox: UICheckbox!
    @IBOutlet var marriedView: UIView!
    @IBOutlet var marriedDate: DCBorderedTextField!
    @IBOutlet var firstChild: DCBorderedTextField!
    @IBOutlet var secondChild: DCBorderedTextField!
    @IBOutlet var sex: DCBorderedTextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //sevomin accept
    @IBAction func copyInvitationCode(_ sender: Any) {
    }
    
    //dovomin accept
    @IBAction func acceptAndResume(_ sender: Any) {
    }
    
    //avalin accept
    @IBAction func firstAcceptAndResume(_ sender: Any) {
    }
    
    
    
    
    

}











































