//
//  StandardAlarmController.swift
//  Wakeupz
//
//  Created by Dylan Shaw on 3/21/17.
//  Copyright © 2017 F4. All rights reserved.


import Foundation
import UIKit
import CoreData

class StandardAlarmController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var standardTime: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        standardTime.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    @IBAction func handleSetRegAlarm(_ sender: Any) {
        let alarm = NSEntityDescription.insertNewObject(forEntityName: "Alarm", into: self.context)
        alarm.setValue(standardTime.date, forKey: "regularWakeup")
        alarm.setValue(false, forKey: "isSmart")
        alarm.setValue(Date(), forKey: "createdAt")
        
        do {
            try context.save()
            print("standard alarm saved")
        } catch {
            print("standard alarm didn't save")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
}





