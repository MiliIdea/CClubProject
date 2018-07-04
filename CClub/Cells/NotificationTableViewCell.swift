//
//  NotificationTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 7/4/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet var clubName: UILabel!
    
    @IBOutlet var switchNotify: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
