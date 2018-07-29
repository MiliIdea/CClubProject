//
//  ClubDetailViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/24/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher
import CoreLocation

class ClubDetailViewController: UIViewController  , UIScrollViewDelegate , UITableViewDelegate , UITableViewDataSource , UICollectionViewDelegate , UICollectionViewDataSource {

    var locationManager : CLLocationManager = CLLocationManager()
    
    @IBOutlet var baseScroller: UIScrollView!
    
    @IBOutlet var topBarView: UIView!
    
    @IBOutlet var headerView: UIView!
    
    @IBOutlet var pagerView: UIView!
    
    @IBOutlet var topPagerButtonsView: UIView!
    var firstOrigin : CGFloat = 0.0
    
    @IBOutlet var clubName: UILabel!
    @IBOutlet var myPoints: UILabel!
    @IBOutlet var myCredit: UILabel!
    @IBOutlet var fromDate: UILabel!
    @IBOutlet var myLvl: UILabel!
    @IBOutlet var clubImage: UIImageView!
    
    //MARK: -TabsView
    @IBOutlet var view1: UIView!
    @IBOutlet var sliderCollection: UICollectionView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var mobileNumber: UILabel!
    @IBOutlet var phoneNumberButton: UIButton!
    @IBOutlet var mapImage: UIImageView!
    @IBOutlet var map: MKMapView!
    
    
    
    @IBOutlet var view2: UIView!
    @IBOutlet var giftTable: UITableView!
    @IBOutlet var view3: UIView!
    @IBOutlet var scoreTable: UITableView!
    @IBOutlet var view4: UIView!
    @IBOutlet var historyTable: UITableView!
    
    var thisClub : MyClubsRes?
    var giftList : [GiftListRes] = [GiftListRes]()
    var scoreList : [ScoreListRes] = [ScoreListRes]()
    var presentView : UIView?
    var organizationID : String = ""
    var s = false
    var g = false
    var i = false
    var l : LoadingViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.baseScroller.delegate = self
        
        self.pagerView.frame.size.height = self.view1.frame.height
        
        self.baseScroller.contentSize.height = topBarView.frame.height + headerView.frame.height + topPagerButtonsView.frame.height + view1.frame.height
        
        self.firstOrigin = self.topPagerButtonsView.frame.origin.y
        
        presentView = self.view1
        if(locationManager.location != nil){
            let center = CLLocationCoordinate2D(latitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            self.map.setRegion(region, animated: true)
        }
        giftTable.delegate = self
        giftTable.dataSource = self
        self.giftTable.register(UINib(nibName: "GiftTableViewCell", bundle: nil), forCellReuseIdentifier:"GiftTableViewCell")
        scoreTable.delegate = self
        scoreTable.dataSource = self
        self.scoreTable.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier:"ScoreTableViewCell")
        historyTable.delegate = self
        historyTable.dataSource = self
        
        sliderCollection.delegate = self
        sliderCollection.dataSource = self
        sliderCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        myPoints.text = thisClub?.point?.description
        myCredit.text = thisClub?.credit?.description
        let s = URLs.imageServer + ((thisClub?.image?.path) ?? "").replacingOccurrences(of: "\\", with: "-")
        clubImage.kf.setImage(with: URL.init(string: s))
        clubName.text = thisClub?.title
        
        callDatas()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func callPhoneNumber(_ sender: Any) {
        guard let number = URL(string: "tel://" + self.phoneNumber.text!) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func findPath(_ sender: Any) {
        
    }
    
    @IBAction func goTelegramLink(_ sender: Any) {
    }
    
    @IBAction func goInstaLink(_ sender: Any) {
    }
    
    
    
    
    func callDatas(){
        l = App.showLoading(vc: self)
        MyRequests.giftListForClub(vc: self , false , organizationID: self.organizationID){res in
            if(res != nil && res?.result != nil){
                self.giftList = res!.result!
            }
            self.g = true
            self.disLoading()
        }
        MyRequests.scoreListForClub(vc: self, false , organizationID: self.organizationID){res in
            if(res != nil && res?.result != nil){
                self.scoreList = res!.result!
            }
            self.s = true
            self.disLoading()
        }

        MyRequests.getInfoClub(vc: self, false , organizationID: self.organizationID){res in
            if(res != nil && res?.result != nil){
                let r = res?.result
                self.mobileNumber.text = r?.mobileNumber
                self.phoneNumber.text = r?.phoneNumber
                self.phoneNumberButton.setTitle(r?.phoneNumber, for: .normal)
                self.detailLabel.text = r?.description
                self.address.text = r?.address
            }
            self.i = true
            self.disLoading()
        }
        
    }
    
    func disLoading(){
        if(s && g){
            l!.disView()
            self.giftTable.reloadData()
            self.scoreTable.reloadData()
            self.historyTable.reloadData()
        }
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //22966445
        
        if(tableView == scoreTable){
            
            let cell : ScoreTableViewCell = scoreTable.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath as IndexPath) as! ScoreTableViewCell
            let c = self.scoreList[indexPath.row]
            cell.organizationName.text = c.organization?.name
            cell.points.text = c.reward
            cell.title.text = c.eventType?.persianName
            cell.imageIcon.text = App.getScoreIcon(id: (c.eventType?.rowId)!)
            cell.imageIcon.backgroundColor = App.getScoreColor(id: (c.eventType?.rowId)!)
            return cell
            
        }else if(tableView == giftTable){
            
            let cell : GiftTableViewCell = giftTable.dequeueReusableCell(withIdentifier: "GiftTableViewCell", for: indexPath as IndexPath) as! GiftTableViewCell
            let c = self.giftList[indexPath.row]
            cell.clubName.text = "نام باشگاه‌: " + c.fromOrganizationName!
            cell.yourPoint.text = "امتیاز لازم:" + (c.currentPoints?.description)!
            cell.minPoint.text = "امتیاز شما:" + (c.fromRewardValue?.description)!
            cell.title.text = c.toRewardsListName
            cell.giftProgress.progress = Float(c.currentPoints!) / Float(c.fromRewardValue!)
            return cell
            
        }else {
            let cell : GiftTableViewCell = giftTable.dequeueReusableCell(withIdentifier: "GiftTableViewCell", for: indexPath as IndexPath) as! GiftTableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == scoreTable){
            return self.scoreList.count
        }else if(tableView == giftTable){
            return self.giftList.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == scoreTable){
            return 115 * self.view.frame.height / 667
        }else if(tableView == giftTable){
            return 155 * self.view.frame.height / 667
        }else{
            return 0
        }
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell2 : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell2", for: indexPath as IndexPath)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if(scrollView.contentOffset.y > firstOrigin){
            self.topPagerButtonsView.frame.origin.y = scrollView.contentOffset.y
        }else{
            self.topPagerButtonsView.frame.origin.y = firstOrigin
        }

    }
    
    
    @IBAction func tapTab(_ sender: Any) {
        let b : UIButton = (sender as! UIButton)
        for i in 1...4 {
            (self.view.viewWithTag(i) as! UIButton).setTitleColor(UIColor("#7C7C7C"), for: .normal)
        }
        b.setTitleColor(UIColor("#FF0000"), for: .normal)
        goToTab(tab: b.tag)
    }
    
    func goToTab(tab : Int){
        view1.alpha = 0
        view2.alpha = 0
        view3.alpha = 0
        view4.alpha = 0
        var goalView : UIView = view1
        switch tab {
        case 1:
            goalView = view1
            break
        case 2:
            goalView = view2
            break
        case 3:
            goalView = view3
            break
        case 4:
            goalView = view4
            break
        default:
            goalView = view1
        }
        goalView.alpha = 1
        presentView?.alpha = 1
        self.baseScroller.contentSize.height = topBarView.frame.height + headerView.frame.height + topPagerButtonsView.frame.height + goalView.frame.height
        if(presentView == goalView){
            return
        }
        
        print(goalView.tag)
        print(presentView?.tag)
        
        if(goalView.tag > (presentView?.tag)!){
            goalView.frame.origin.x = -1 * self.view.frame.width
            presentView?.frame.origin.x = 0
            UIView.animate(withDuration: 0.3,delay: 0.0,options: .curveEaseInOut ,animations: {
                goalView.frame.origin.x = 0
                self.presentView?.frame.origin.x = self.view.frame.width + 10
            }){completion in
                self.presentView = goalView
            }
        }else{
            goalView.frame.origin.x = self.view.frame.width
            presentView?.frame.origin.x = 0
            UIView.animate(withDuration: 0.3,delay: 0.0,options: .curveEaseInOut ,animations: {
                goalView.frame.origin.x = 0
                self.presentView?.frame.origin.x = -1 * self.view.frame.width - 10
            }){completion in
                self.presentView = goalView
            }
        }
        
        
    }
    
}













































