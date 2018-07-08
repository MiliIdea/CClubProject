//
//  PermissionPopupViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/7/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class PermissionPopupViewController: UIViewController {

    @IBOutlet var backPopup: UIView!
    @IBOutlet var popupView: DCBorderedView!
    @IBOutlet var titleOfPopup: UILabel!
    @IBOutlet var descOfPopup: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes(_ sender: Any) {
    }
    
    @IBAction func no(_ sender: Any) {
    }
    


}
