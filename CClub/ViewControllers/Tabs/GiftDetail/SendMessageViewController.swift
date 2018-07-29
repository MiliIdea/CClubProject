//
//  SendMessageViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/4/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class SendMessageViewController: UIViewController {

    @IBOutlet var messageTextView: DCBorderedTextView!
    
    var rowId : CLongLong = 0
    
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
    
    @IBAction func sendMessage(_ sender: Any) {
        MyRequests.saveComment(vc: self, txt: self.messageTextView.text, rowId: rowId, subject: .REWARD){ res in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
