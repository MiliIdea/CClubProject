//
//  GiftDetailViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class GiftDetailViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var giftImage: UIImageView!
    
    @IBOutlet var shareButton: DCBorderedButton!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    @IBOutlet var remainingGiftLabel: UILabel!
    
    @IBOutlet var minScoreNeededLabel: UILabel!
    @IBOutlet var myScore: UILabel!
    @IBOutlet var giftProgress: UIProgressView!
    @IBOutlet var giftProvider: UILabel!
    @IBOutlet var detailProvider: UILabel!
    
    @IBOutlet var numberOfComments: UILabel!
    @IBOutlet var commentsTable: UITableView!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    @IBAction func back(_ sender: Any) {
    }
    
    @IBAction func moreComments(_ sender: Any) {
    }
    
    
    
    

}








































































