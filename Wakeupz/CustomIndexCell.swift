//
//  CustomIndexCell.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit

class CustomIndexCell: UITableViewCell {

    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        
        
        if (sender.isOn == true ) {
            timeLabel.textColor = UIColor.white
            placeLabel.textColor = UIColor.white
        } else {
            timeLabel.textColor = UIColor.lightGray
            placeLabel.textColor = UIColor.lightGray
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
