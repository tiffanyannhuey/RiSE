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
    @IBOutlet weak var newAddress: UITextField!
    @IBOutlet weak var newDatePicker: UIDatePicker!
    @IBOutlet weak var avgReadyDuration: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        newDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        avgReadyDuration.setValue(UIColor.white, forKeyPath: "textColor")
    }
    
    func validateName() -> Bool {
        if newObligationName.text == "" {
            // pop up here
            print("new obligation name fail")
            return false
        } else {
            return true
        }
    }
    
    func validateAddress() -> Bool {
        if newAddress.text == "" {
            // pop up here
            print("new obligation address fail")
            return false
        } else {
            return true
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setObligationValues() -> Bool {
        let obligation = NSEntityDescription.insertNewObject(forEntityName: "Obligation", into: self.context)
        
        if validateName() && validateAddress() {
            obligation.setValue(newObligationName.text, forKey: "name")
            obligation.setValue(newAddress.text, forKey: "address")
            // set estimatedDrivingDuration value here
            obligation.setValue(avgReadyDuration.countDownDuration, forKey: "avgReadyTime")
            obligation.setValue(newDatePicker.date, forKey: "idealArrivalTime")
            obligation.setValue(Date(), forKey: "createdAt")
            return true
        } else {
            return false
        }
    }
    
    @IBAction func handleAddNewObligation(_ sender: UIButton) {
        
        if setObligationValues() {
            do {
                try context.save()
                print("obligation saved!")
            } catch {
                print("oopsies didn't save")
            }
            navigationController?.popViewController(animated: true)
        }
    }
}
