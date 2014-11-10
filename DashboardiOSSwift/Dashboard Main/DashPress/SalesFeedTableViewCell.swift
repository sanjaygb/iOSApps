//
//  SalesFeedTableViewCell.swift
//  DashPress
//
//  Created by My App Templates Team on 23/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class SalesFeedTableViewCell: UITableViewCell {
    
    
    @IBOutlet var imgSale : UIImageView!
    @IBOutlet var imgNew : UIImageView!
    @IBOutlet var lblPaypal : UILabel!
    @IBOutlet var lblTime : UILabel!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblOrderNumber : UILabel!
    @IBOutlet var lblAmount : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
