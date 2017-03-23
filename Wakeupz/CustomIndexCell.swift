//
//  CustomIndexCell.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit
import UserNotifications
import AVFoundation
import AudioToolbox

class CustomIndexCell: UITableViewCell {

    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var toggleAlarm: UISwitch!
    
    @IBAction func `switch`(_ sender: UISwitch) {
     
    
    // variables for setting up alarm notifications ----------------------------
    let content = UNMutableNotificationContent()
    content.title = "Wake Up!"
    content.subtitle = "Good morning sunshine"
    content.body = "Don't stay in bed or else you'll be late. Really. Get up."
    content.badge = 1
    content.sound = UNNotificationSound.init(named: "080_space-music-arpeggios.aif")
    
    let alarm = timeLabel.text
    let dateFormatter = DateFormatter()
    // dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "hh:mm a"
    dateFormatter.timeZone = TimeZone.current
    
    let starting_time = dateFormatter.date(from: alarm!)
    let calendar = Calendar.current
    let comp = calendar.dateComponents([.hour, .minute], from: starting_time!)
    let hour = comp.hour
    let minute = comp.minute
    
    
    var time = DateComponents()
    time.hour = hour
    time.minute = minute
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
    let request = UNNotificationRequest(identifier: "setAlarm", content: content, trigger: trigger)
    // -------------------------------------------------------------------------
    
    if (sender.isOn == true ) {
    timeLabel.textColor = UIColor.white
    placeLabel.textColor = UIColor.white
    
    // set up delivery of alarm notification
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
    } else {
    timeLabel.textColor = UIColor.lightGray
    placeLabel.textColor = UIColor.lightGray
    
    // remove pending alarm notifications for this table cell
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["setAlarm"])
    print("This is turned off")
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
