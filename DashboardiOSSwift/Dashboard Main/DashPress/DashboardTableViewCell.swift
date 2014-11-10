//
//  DashboardTableViewCell.swift
//  DashPress
//
//  Created by My App Templates Team on 24/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet var lblAmount : UILabel!
    @IBOutlet var lblPercent : UILabel!
    @IBOutlet var lblDay: UILabel!
    @IBOutlet var lblType: UILabel!
    @IBOutlet var bgImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
