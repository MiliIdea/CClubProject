//
//  GiftViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet var giftTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        giftTable.delegate = self
        giftTable.dataSource = self
        self.giftTable.register(UINib(nibName: "GiftTableViewCell", bundle: nil), forCellReuseIdentifier:"GiftTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return App.giftList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : GiftTableViewCell = giftTable.dequeueReusableCell(withIdentifier: "GiftTableViewCell", for: indexPath as IndexPath) as! GiftTableViewCell
        let c = App.giftList[indexPath.row]
        cell.clubName.text = "نام باشگاه‌: " + c.fromOrganizationName!
        cell.yourPoint.text = "امتیاز لازم:" + (c.currentPoints?.description)!
        cell.minPoint.text = "امتیاز شما:" + (c.fromRewardValue?.description)!
        cell.title.text = c.toRewardsListName
        cell.giftProgress.progress = Float(c.currentPoints!) / Float(c.fromRewardValue!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155 * self.view.frame.height / 667
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let c = App.giftList[indexPath.row]
        MyRequests.getComment(vc: self, subject: (c.rowId?.description)!, rowId: .REWARD){ res in
            if(res != nil && (res?.done)!){
                let vC : GiftDetailViewController = (self.storyboard?.instantiateViewController(withIdentifier: "GiftDetailViewController"))! as! GiftDetailViewController
                vC.comments = (res?.result)!
                vC.giftData = c
                self.navigationController?.pushViewController(vC, animated: true)
            }else{
                self.view.makeToast(res?.errorDesc)
            }
        }
        
    }
    
    

}







































