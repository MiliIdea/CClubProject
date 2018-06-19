//
//  MainPageViewController.swift
//  CClub
//
//  Created by MehrYasan on 5/15/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Kingfisher

class MainPageViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource{

    @IBOutlet var giftCollection: UICollectionView!
    @IBOutlet var scoreCollection: UICollectionView!
    @IBOutlet var clubsCollection: UICollectionView!
    @IBOutlet var newsCollection: UICollectionView!
    @IBOutlet var myScrollView: UIScrollView!
    @IBOutlet var viewInScrollView: UIView!
    
    
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
        
        self.myScrollView.contentSize = self.viewInScrollView.frame.size
        
        self.callDatas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath as IndexPath) as! MainCollectionViewCell
        
        if(collectionView == self.giftCollection){
            
            cell.pointsLabel.text = "امتیاز لازم"
            cell.awardImage.kf.setImage(with: URL.init(string: URLs.imageServer + ((App.giftList[indexPath.item].toPhoto?.path) ?? "").replacingOccurrences(of: "//", with: "-")))
            cell.club.text = App.giftList[indexPath.item].fromOrganizationName
            cell.points.text = (App.giftList[indexPath.item].fromRewardValue)?.description
            cell.awardName.text = App.giftList[indexPath.item].toRewardsListName
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else if(collectionView == self.scoreCollection){
            
            cell.pointsLabel.text = "امتیاز"
            cell.points.text = App.scoreList[indexPath.item].eventType?.persianName
            cell.awardName.text = App.scoreList[indexPath.item].reward
            cell.club.text = ""
            cell.awardImage.image = UIImage.init(named: "")
            
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            return cell
        }else if(collectionView == self.clubsCollection){
            
            cell.pointsLabel.text = "جمع امتیاز"
            cell.points.text = (App.myClubs[indexPath.item].point)?.description
            cell.awardName.text = App.myClubs[indexPath.item].title
            cell.club.text = ""
            cell.awardImage.image = UIImage.init(named: "")
            
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
            if(res != nil){
                App.giftList = res!.result!
            }
            self.g = true
            self.disLoading()
        }
        MyRequests.scoreList(vc: self, false){res in
            if(res != nil){
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
            if(res != nil){
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



























