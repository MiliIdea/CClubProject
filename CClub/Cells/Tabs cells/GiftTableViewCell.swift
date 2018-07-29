//
//  GiftTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class GiftTableViewCell: UITableViewCell {

    @IBOutlet var giftImage: UIImageView!
    
    @IBOutlet var title: UILabel!
    
    @IBOutlet var clubName: UILabel!
    
    @IBOutlet var minPoint: UILabel!
    
    @IBOutlet var yourPoint: UILabel!
    
    @IBOutlet var giftProgress: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
