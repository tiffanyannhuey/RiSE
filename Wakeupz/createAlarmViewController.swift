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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //Setup for location picker 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

   
}
