//
//  ObligationTableViewController.swift
//  Wakeupz
//
//  Created by Tiffany Huey on 3/18/17.
//  Copyright © 2017 F4. All rights reserved.
//

import UIKit

class ObligationTableViewController: UITableViewController {
    
    var places = ["DBC", "Home", "Work", "Gym", "Church" ]
    var addresses = ["707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101", "707 Broadway Ave | San Diego, CA | 92101"]



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

}
