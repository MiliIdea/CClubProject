//
//  MainPageViewController.swift
//  CClub
//
//  Created by MehrYasan on 5/15/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Kingfisher
import UIColor_Hex_Swift

class MainPageViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet var giftCollection: UICollectionView!
    @IBOutlet var scoreCollection: UICollectionView!
    @IBOutlet var clubsCollection: UICollectionView!
    @IBOutlet var newsCollection: UICollectionView!
    @IBOutlet var myScrollView: UIScrollView!
    @IBOutlet var viewInScrollView: UIView!
    @IBOutlet var sliderCollection: UICollectionView!
    
    
    var g = false
    var s = false
    var mc = false
    var n = false
    
    var l : LoadingViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.giftCollection.delegate = self
        self.giftCollection.dataSource = self
        self.giftCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        self.giftCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.scoreCollection.delegate = self
        self.scoreCollection.dataSource = self
        self.scoreCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        self.scoreCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.clubsCollection.delegate = self
        self.clubsCollection.dataSource = self
        self.clubsCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        self.clubsCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.newsCollection.delegate = self
        self.newsCollection.dataSource = self
        self.newsCollection.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        self.newsCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.sliderCollection.delegate = self
        self.sliderCollection.dataSource = self
        self.sliderCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        self.myScrollView.contentSize = self.viewInScrollView.frame.size
        
        self.callDatas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == self.sliderCollection){
            
            let cell2 : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath as IndexPath)
            cell2.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            if(indexPath.item == 0){
                (cell2.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "image1")
                return cell2
            }else if(indexPath.item == 1){
                (cell2.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "image2")
                return cell2
            }else if(indexPath.item == 2){
                (cell2.viewWithTag(10) as! UIImageView).image = UIImage.init(named: "image3")
                return cell2
            }
            return cell2
            
        }
        
        let cell : MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath as IndexPath) as! MainCollectionViewCell
        
        if(collectionView == self.giftCollection){
            
            cell.pointsLabel.text = "امتیاز لازم"
            let s = URLs.imageServer + ((App.giftList[indexPath.item].toPhoto?.path) ?? "").replacingOccurrences(of: "\\", with: "-")
            cell.awardImage.kf.setImage(with: URL.init(string: s))
            cell.club.text = App.giftList[indexPath.item].fromOrganizationName
            cell.points.text = (App.giftList[indexPath.item].fromRewardValue)?.description
            cell.awardName.text = App.giftList[indexPath.item].toRewardsListName
            cell.backImageLabel.backgroundColor = UIColor("D0CCCC")
            cell.backImageLabel.text = ""
            cell.backImageLabel.textColor = UIColor.gray
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else if(collectionView == self.scoreCollection){
            
            cell.pointsLabel.text = "امتیاز"
            cell.points.text = App.scoreList[indexPath.item].eventType?.persianName
            cell.awardName.text = App.scoreList[indexPath.item].reward
            cell.club.text = ""
            cell.awardImage.image = UIImage.init(named: "")
            cell.backImageLabel.text = App.getScoreIcon(id: (App.scoreList[indexPath.item].eventType?.rowId)!)
            cell.backImageLabel.backgroundColor = App.getScoreColor(id: (App.scoreList[indexPath.item].eventType?.rowId)!)
            cell.backImageLabel.textColor = UIColor.white
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else if(collectionView == self.clubsCollection){
            
            cell.pointsLabel.text = "جمع امتیاز"
            cell.points.text = (App.myClubs[indexPath.item].point)?.description
            cell.awardName.text = App.myClubs[indexPath.item].title
            cell.club.text = App.myClubs[indexPath.item].closestRewardName
            cell.backImageLabel.alpha = 0
            let s = URLs.imageServer + ((App.myClubs[indexPath.item].image?.path) ?? "").replacingOccurrences(of: "\\", with: "-")
            cell.awardImage.kf.setImage(with: URL.init(string: s))
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else if(collectionView == self.newsCollection){
            
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else{
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.giftCollection){
            return App.giftList.count
        }else if(collectionView == self.scoreCollection){
            return App.scoreList.count
        }else if(collectionView == self.clubsCollection){
            return App.myClubs.count
        }else if(collectionView == self.newsCollection){
            return 0
        }else if(collectionView == self.sliderCollection){
            return 3
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == self.giftCollection){
            
        }else if(collectionView == self.scoreCollection){
            
        }else if(collectionView == self.clubsCollection){
            
        }else if(collectionView == self.newsCollection){
            
        }else{
            
        }
        
    }
    
    
    
    
    func callDatas(){
        l = App.showLoading(vc: self)
        MyRequests.giftList(vc: self , false){res in
            if(res != nil && res?.result != nil){
                App.giftList = res!.result!
            }
            self.g = true
            self.disLoading()
        }
        MyRequests.scoreList(vc: self, false){res in
            if(res != nil && res?.result != nil){
                App.scoreList = res!.result!
            }
            self.s = true
            self.disLoading()
        }
        MyRequests.newsList(vc: self, false){res in
            self.n = true
            self.disLoading()
        }
        MyRequests.myClubsList(vc: self, false){res in
            if(res != nil && res?.result != nil){
                App.myClubs = res!.result!
            }
            self.mc = true
            self.disLoading()
        }
    }
    
    func disLoading(){
        if(s && mc && g){
            l!.disView()
            print(App.myClubs)
            print()
            print(App.scoreList)
            print()
            print(App.giftList)
            print()
            self.giftCollection.reloadData()
            self.scoreCollection.reloadData()
            self.clubsCollection.reloadData()
            self.newsCollection.reloadData()
        }
    }
    

}



























