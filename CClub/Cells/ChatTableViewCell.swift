//
//  ChatTableViewCell.swift
//  CClub
//
//  Created by MehrYasan on 7/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Spring

class ChatTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: DesignableImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var txtView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
