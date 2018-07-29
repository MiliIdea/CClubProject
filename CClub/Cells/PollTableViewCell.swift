//
//  PollTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 7/17/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class PollTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    
    @IBOutlet var isDone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
