//
//  CustomCell.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/5/31.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
