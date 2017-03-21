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
    
    
    @IBOutlet weak var standardTime: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        standardTime.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
}





