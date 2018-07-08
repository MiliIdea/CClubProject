//
//  GiftDetailViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit
import Kingfisher
import Alamofire
import CodableAlamofire

class GiftDetailViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource , UIScrollViewDelegate{

    
    @IBOutlet var navigationTitle: UILabel!
    
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
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var baseTableView: DCBorderedView!
    
    var comments : [CommentRes] = [CommentRes]()
    var heights : [CGFloat]?
    var giftData : GiftListRes?
    var isExpanded : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        commentsTable.delegate = self
        commentsTable.dataSource = self
        self.commentsTable.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier:"ChatTableViewCell")
        heights = Array.init(repeating: 175 / 675 * self.view.frame.height, count: comments.count)
        likeLabel.text = giftData?.likedCount?.description
        commentLabel.text = giftData?.commentCount?.description
        remainingGiftLabel.text = giftData?.remainedCount?.description
        minScoreNeededLabel.text = giftData?.fromRewardValue?.description
        myScore.text = giftData?.currentPoints?.description
        giftProgress.progress = Float((giftData?.currentPoints)!) / Float((giftData?.fromRewardValue)!)
        giftProvider.text = "اراءه دهنده این جایزه: " + (giftData?.toOrganizationName)!
        detailProvider.text = giftData?.description
        numberOfComments.text = giftData?.commentCount?.description
        commentsTable.estimatedRowHeight = 175 / 675 * self.view.frame.height
        
        calculateScroller()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func calculateHeghtOfTable(){
        if(isExpanded){
            self.commentsTable.reloadData()
            self.commentsTable.frame.origin.y = self.giftImage.frame.origin.y
            self.commentsTable.frame.size.height = self.view.frame.height - self.commentsTable.frame.origin.y - (self.tabBarController?.tabBar.frame.height)!
            self.moreButton.frame.origin.y = self.view.frame.height
        }else{
            if(comments.count < 4){
                self.commentsTable.reloadData()
                self.commentsTable.frame.origin.y = self.numberOfComments.frame.height + self.numberOfComments.frame.origin.y
                self.commentsTable.frame.size.height = (175 / 675 * self.view.frame.height) * CGFloat((giftData?.commentCount)!)
                self.moreButton.alpha = 0
                self.moreButton.frame.origin.y = self.commentsTable.frame.height + self.commentsTable.frame.origin.y
            }else{
                self.commentsTable.reloadData()
                self.commentsTable.frame.origin.y = self.numberOfComments.frame.height + self.numberOfComments.frame.origin.y
                self.commentsTable.frame.size.height = (175 / 675 * self.view.frame.height) * 3
                self.moreButton.frame.origin.y = self.commentsTable.frame.height + self.commentsTable.frame.origin.y
            }
        }
    }
    
    func calculateScroller(){
        calculateHeghtOfTable()
        if(isExpanded){
            self.scrollView.setContentOffset(.init(x: 0, y: 0), animated: true)
            self.scrollView.isScrollEnabled = false
        }else{
            self.scrollView.setContentOffset(.init(x: 0, y: 0), animated: true)
            self.scrollView.isScrollEnabled = true
            self.scrollView.contentSize.height = moreButton.frame.height + moreButton.frame.origin.y
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if(isExpanded){
            isExpanded = false
            calculateScroller()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func moreComments(_ sender: Any) {
        self.isExpanded = true
        calculateScroller()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(isExpanded){
            return comments.count
        }else{
            if(comments.count < 3){
                return comments.count
            }else{
                return 3
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : ChatTableViewCell = commentsTable.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath as IndexPath) as! ChatTableViewCell
        
        cell.nameLabel.text = comments[indexPath.row].user?.fullName
        
        let s = URLs.imageServer + ((comments[indexPath.row].user?.file?.path) ?? "").replacingOccurrences(of: "\\", with: "-")

        cell.profileImage.kf.setImage(with: URL.init(string: s))
        
        cell.txtView.text = comments[indexPath.row].content
        
        cell.txtView.frame.size.height = cell.txtView.contentSize.height
        
        cell.frame.size.height = cell.txtView.frame.size.height + cell.txtView.frame.origin.y
        
        print(cell.txtView.frame.size.height + cell.txtView.frame.origin.y)
        
        self.heights![indexPath.row] = cell.txtView.frame.size.height + cell.txtView.frame.origin.y
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if((heights?.count)! - 1 >= indexPath.row){
            return heights![indexPath.row]
        }else{
            return 175 / 675 * self.view.frame.height
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
//        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    @IBAction func setComment(_ sender: Any) {
        let vC : SendMessageViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SendMessageViewController"))! as! SendMessageViewController
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    @IBAction func like(_ sender: Any) {
        if(likeButton.title(for: .normal) == ""){
            likeButton.setTitle("", for: .normal)
        }else{
            likeButton.setTitle("", for: .normal)
        }
    }
    
}








































































