//
//  IndexTableViewController.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit



class IndexTableViewController: UITableViewController {
    
    var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    var times = ["6:45", "8:15", "10:00", "7:23", "12:30"]

    
    override func viewDidLoad() {
        self.showAlert()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return places.count 
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! CustomIndexCell


        cell.placeLabel.text = places[indexPath.row]
        cell.timeLabel.text = times[indexPath.row]
        
        cell.toggleAlarm.onTintColor = UIColor(red: (20/255.0), green: (95/255.0), blue: (244/255.0), alpha: 1.0)
        cell.toggleAlarm.tintColor = UIColor(red: (20/255.0), green: (95/255.0), blue: (244/255.0), alpha: 1.0)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.places.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Hello!", message: "Click the '+' button on the top-right corner to get started.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }


}
