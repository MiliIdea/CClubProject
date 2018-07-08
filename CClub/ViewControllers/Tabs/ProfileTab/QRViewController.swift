//
//  QRViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/7/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mobile: UILabel!
    @IBOutlet var joinAddress: UILabel!
    @IBOutlet var unicCode: UILabel!
    
    @IBOutlet var qRImageView: UIImageView!
    
    
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
    
    
    
    

}







































