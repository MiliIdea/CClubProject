//
//  ClubsViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class ClubsViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    

    @IBOutlet var clubTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clubTable.delegate = self
        clubTable.dataSource = self
        self.clubTable.register(UINib(nibName: "ClubTableViewCell", bundle: nil), forCellReuseIdentifier:"ClubTableViewCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return App.myClubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ClubTableViewCell = clubTable.dequeueReusableCell(withIdentifier: "ClubTableViewCell", for: indexPath as IndexPath) as! ClubTableViewCell
        let c = App.myClubs[indexPath.row]
        
        cell.clubeName.text = c.title
        cell.allPoints.text = c.point?.description
        cell.nearestGift.text = c.closestRewardName
        let s = URLs.imageServer + ((c.image?.path) ?? "").replacingOccurrences(of: "\\", with: "-")
        cell.clubImage.kf.setImage(with: URL.init(string: s))

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vC : ClubDetailViewController = (self.storyboard?.instantiateViewController(withIdentifier: "ClubDetailViewController"))! as! ClubDetailViewController
        let c : MyClubsRes = App.myClubs[indexPath.row]
        vC.organizationID = ((c.organizationId ?? 0).description)
        vC.thisClub = c
        self.navigationController?.pushViewController(vC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115 * self.view.frame.height / 667
    }

}

















