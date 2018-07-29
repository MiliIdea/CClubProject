//
//  ContactTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 7/14/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet var baseView: DCBorderedView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var cclubImage: UIImageView!
    
    @IBOutlet var inviteButton: DCBorderedButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
