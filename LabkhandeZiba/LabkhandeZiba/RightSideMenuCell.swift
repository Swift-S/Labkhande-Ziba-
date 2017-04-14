//
//  RightSideMenuCell.swift
//  LabkhandeZiba
//
//  Created by Amir Daliri on 4/11/17.
//  Copyright © 2017 Labkhand. All rights reserved.
//

import UIKit

class RightSideMenuCell: UITableViewCell {

  @IBOutlet weak var menuItemCell: UILabel!
  @IBOutlet weak var MenuItemIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
