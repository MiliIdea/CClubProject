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

        nameLabel.text = App.getProfileRes?.fullName
        mobile.text = App.getProfileRes?.person?.mobileNumber
        joinAddress.text = App.getLevelRes?.fromDate
        MyRequests.getUserQRCode(vc: self){res in
            if(res != nil && (res?.done!)!){
                self.unicCode.text = (res?.result?.ccardNumber)!
                self.qRImageView.image = self.generateQRCode(from: (res?.result?.ccardNumber)!)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    

}







































