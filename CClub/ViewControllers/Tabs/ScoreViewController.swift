//
//  ScoreViewController.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    

    @IBOutlet var scoreTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return App.scoreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ScoreTableViewCell = scoreTable.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath as IndexPath) as! ScoreTableViewCell
        
        return cell
    }

}
