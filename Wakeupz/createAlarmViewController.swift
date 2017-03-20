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

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(backAction))
        
        // Do any additional setup if required.
    }
    
    func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placeSelection = row
    }
    
    func Submit(sender: AnyObject) {
        if (placeSelection == 0) {
        }
    }

   
}
