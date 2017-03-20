//
//  CreateObligationViewController.swift
//  Wakeupz
//
//  Created by Allison Ines on 3/19/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit
import CoreData

class CreateObligationViewController: UIViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var newObligationName: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var newAddress: UITextField!
    @IBOutlet weak var newEstimatedDriveDuration: UITextField!
    @IBOutlet weak var avgReadyDuration: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func setObligationValues() {
        let obligation = NSEntityDescription.insertNewObject(forEntityName: "Obligation", into: self.context)
        
        obligation.setValue(newObligationName.text, forKey: "name")
        
        obligation.setValue(newAddress.text, forKey: "address")
        
        let stringEstDriveDuration = newEstimatedDriveDuration.text
        let intEstDriveDuration = Int(stringEstDriveDuration!)
        obligation.setValue(intEstDriveDuration, forKey: "estimatedDrivingDuration")
    
        let stringAvgReadyTime = avgReadyDuration.text
        let intAvgReadyTime = Int(stringAvgReadyTime!)
        obligation.setValue(intAvgReadyTime, forKey: "avgReadyTime")
    
        obligation.setValue(myDatePicker.date, forKey: "idealArrivalTime")
    }
    
    @IBAction func handleAddNewObligation(_ sender: UIButton) {
        
        setObligationValues()
        
        do {
            try context.save()
            print("hello")
        } catch {
            print("oopsies didn't work")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
