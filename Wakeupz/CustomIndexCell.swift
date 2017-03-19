//
//  CustomIndexCell.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit

class CustomIndexCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var placeField: UITextField!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn == true ) {
            print("You've put the alarm on!")
        } else {
            print("You turned off the alarm")
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
