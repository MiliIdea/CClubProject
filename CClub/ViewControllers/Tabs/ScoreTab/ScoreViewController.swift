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
        
        scoreTable.delegate = self
        scoreTable.dataSource = self
        self.scoreTable.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier:"ScoreTableViewCell")
        
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
        let c = App.scoreList[indexPath.row]
        cell.organizationName.text = c.organization?.name
        cell.points.text = c.reward
        cell.title.text = c.eventType?.persianName
        cell.imageIcon.text = App.getScoreIcon(id: (c.eventType?.rowId)!)
        cell.imageIcon.backgroundColor = App.getScoreColor(id: (c.eventType?.rowId)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115 * self.view.frame.height / 667
    }

}








