//
//  AwardsTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 5/14/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class AwardsTableViewCell: UITableViewCell {

    
    @IBOutlet var awardName: UILabel!
    @IBOutlet var club: UILabel!
    @IBOutlet var points: UILabel!
    @IBOutlet var awardImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
