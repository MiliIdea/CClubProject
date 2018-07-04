//
//  GiftDetailViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class GiftDetailViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate{

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
    
    var comments : [CommentRes] = [CommentRes]()
    var giftData : GiftListRes?
    var isExpanded : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        commentsTable.delegate = self
        commentsTable.dataSource = self
        self.commentsTable.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier:"ChatTableViewCell")
        
        likeLabel.text = giftData?.likedCount?.description
        commentLabel.text = giftData?.commentCount?.description
        remainingGiftLabel.text = giftData?.remainedCount?.description
        minScoreNeededLabel.text = giftData?.fromRewardValue?.description
        myScore.text = giftData?.currentPoints?.description
        giftProgress.progress = Float(giftData?.currentPoints) / Float(giftData?.fromRewardValue)
        giftProvider.text = "اراءه دهنده این جایزه: " + giftData?.toOrganizationName
        detailProvider.text = giftData.description
        numberOfComments.text = giftData?.commentCount?.description
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moreComments(_ sender: Any) {
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isExpanded){
            return giftData?.commentCount
        }else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChatTableViewCell = giftTable.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath as IndexPath) as! ChatTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175 / 675 * self.view.frame.height
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    

}








































































