//
//  NYTimeArticalTableViewCell.swift
//  NewYork
//
//  Created by Upendra Nimmala on 08/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit

class NYTimeArticalTableViewCell: UITableViewCell {

    @IBOutlet weak var NYTimeArticalDate_lbl: UILabel!
    @IBOutlet weak var NYTimeArticalTitle_lbl: UILabel!
    @IBOutlet weak var NYTimeArticalSource_lbl: UILabel!
    @IBOutlet weak var NYTimeArticalThumb_Img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
