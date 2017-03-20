//
//  ObligationTableViewController.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit
import CoreData

class ObligationTableViewController: UITableViewController {
    
    var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    var addresses = ["707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101"]

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var newObligationName: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var newAddress: UITextField!
    @IBOutlet weak var newEstimatedDriveDuration: UITextField!
    // avg reaady duration

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! CustomRouteCell
        
        cell.locationName.text = places[indexPath.row]
        cell.locationAddress.text = addresses[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.places.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    
    }
    
    func setObligationValues() {
        let obligation = NSEntityDescription.insertNewObject(forEntityName: "Obligation", into: self.context)
        
        obligation.setValue(newObligationName.text, forKey: "name")
        
        obligation.setValue(newAddress.text, forKey: "address")
        
        let stringEstDriveDuration = newEstimatedDriveDuration.text
        let intEstDriveDuration = Int(stringEstDriveDuration!)
        obligation.setValue(intEstDriveDuration, forKey: "estimatedDrivingDuration")
        
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

}
