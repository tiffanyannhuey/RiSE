//
//  createAlarmViewController.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/19/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit
import CoreData

class createAlarmViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var earliestWakeupTime: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var isOn: UISwitch!

    
    var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    var placeSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(backAction))

        earliestWakeupTime.backgroundColor = .white
        

    }
    
    func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
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
    
    func calculateWakeup() {
        
        /* algorithm for calculating wake up time. function should return wake up time to
         to be stored in Core data */
    }
    
    func setAlarmValues() {
        let alarm = NSEntityDescription.insertNewObject(forEntityName: "Alarm", into: self.context)
        
        var updatedWakeupTime = calculateWakeup()
        alarm.setValue(updatedWakeupTime, forKey: "calculatedWakeup")
        alarm.setValue(isOn.isOn, forKey: "isOn")
        alarm.setValue(earliestWakeupTime.date, forKey: "earliestWakeup")
        
    }
    
    @IBAction func handleAddNewAlarm(sender: UIButton) {
        setAlarmValues()
        
        do {
            try context.save()
            print("hello")
        } catch {
            print("ooopsies didn't work")
        }
    }

   
}
