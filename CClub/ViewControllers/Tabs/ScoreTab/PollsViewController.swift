//
//  PollsViewController.swift
//  CClub
//
//  Created by MehrYasan on 7/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class PollsViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var pollTable: UITableView!
    
    var polls : [GetPollRes] = [GetPollRes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pollTable.register(UINib(nibName: "PollTableViewCell", bundle: nil), forCellReuseIdentifier:"PollTableViewCell")
        self.pollTable.delegate = self
        self.pollTable.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.polls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : PollTableViewCell = pollTable.dequeueReusableCell(withIdentifier: "PollTableViewCell", for: indexPath as IndexPath) as! PollTableViewCell
        
        let c = self.polls[indexPath.row]
        
        cell.title.text = c.title
        if(c.isDone ?? false){
            cell.isDone.text = "انجام شده"
        }else{
            cell.isDone.text = "انجام نشده"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let c = self.polls[indexPath.row]
        
        MyRequests.getDetailPolls(vc: self, scenarioID: (c.scenarioId?.description)!){res in
            
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108 * self.view.frame.height / 667
    }
    
    

}



























