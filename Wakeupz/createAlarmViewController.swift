//
//  createAlarmViewController.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/19/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit

class createAlarmViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    var placeSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    //Setup for location picker 

//    let attributedString:NSAttributedString?
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//            let attributedString = NSAttributedString(string: "\(places[row])", attributes: [NSForegroundColorAttributeName : UIColor.white])
//            return attributedString
//        }
//        return attributedString
        return places[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placeSelection = row
    }
    
    func Submit(sender: AnyObject) {
        if (placeSelection == 0) {
        }
    }

   
}
