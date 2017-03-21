//
//  SelectTypeController.swift
//  Wakeupz
//
//  Created by Dylan Shaw on 3/21/17.
//  Copyright © 2017 F4. All rights reserved.
//

import Foundation
import UIKit


class SelectTypeController: UITableViewController {

    override func viewDidLoad() {
        self.showAlert()
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "You made it!", message: "Tap 'New Smart Alarm' if you need to wake up for an event. Otherwise, tap 'New Standard Alarm'", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
