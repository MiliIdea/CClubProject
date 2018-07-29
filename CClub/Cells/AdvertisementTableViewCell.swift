//
//  ClubTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 5/14/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {

    @IBOutlet var advertiseImage: UIImageView!
    
    @IBOutlet var advertiseTitle: UILabel!
    
    @IBOutlet var advertiseSubtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
