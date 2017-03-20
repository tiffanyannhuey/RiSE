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

    var obligations: [Obligation] = []
    
    // var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    // var placeSelection = 0
    var obligationSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self

        earliestWakeupTime.backgroundColor = .white
        
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            obligations = try context.fetch(Obligation.fetchRequest())
        } catch {
            print("Fetching failed")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        // picker.reloadData()
    }
    
    //Setup for location picker 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // return places[row]
        let obligation = obligations[row]
        return obligation.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return places.count
        return obligations.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // placeSelection = row
        obligationSelection = row
    }
    
    func calculateWakeup() {
        
        /* algorithm for calculating wake up time. function should return wake up time to
         to be stored in Core data */
    }
    
    func setAlarmValues() {
        let alarm = NSEntityDescription.insertNewObject(forEntityName: "Alarm", into: self.context)
        
        let updatedWakeupTime = calculateWakeup()
        alarm.setValue(updatedWakeupTime, forKey: "calculatedWakeup")
        alarm.setValue("false", forKey: "isOn")
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
