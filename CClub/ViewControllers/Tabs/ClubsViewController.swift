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
        
        return cell
    }
    

}
