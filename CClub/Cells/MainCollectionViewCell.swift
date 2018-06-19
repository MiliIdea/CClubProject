//
//  MainCollectionViewCell.swift
//  CClub
//
//  Created by MehrYasan on 6/18/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet var awardName: UILabel!
    @IBOutlet var club: UILabel!
    @IBOutlet var points: UILabel!
    @IBOutlet var awardImage: UIImageView!
    @IBOutlet var pointsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
