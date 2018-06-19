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
        
        return cell
    }

}
