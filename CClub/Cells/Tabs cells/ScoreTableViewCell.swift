//
//  ScoreTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    
    @IBOutlet var organizationName: UILabel!
    
    @IBOutlet var points: UILabel!
    
    @IBOutlet var imageIcon: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
