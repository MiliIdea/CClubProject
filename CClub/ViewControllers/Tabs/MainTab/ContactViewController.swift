//
//  ContactViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/4/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {

    @IBOutlet var web: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phone: UILabel!
    
    @IBOutlet var mapImage: UIImageView!
    
    @IBOutlet var phoneButton: UIButton!
    @IBOutlet var routingButton: UIButton!
    
    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func call(_ sender: Any) {
    }
    
    @IBAction func routing(_ sender: Any) {
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
