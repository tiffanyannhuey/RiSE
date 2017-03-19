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


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return places.count 
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! CustomIndexCell


        cell.placeField.text = places[indexPath.row]
        cell.timeLabel.text = times[indexPath.row]
        

        return cell
    }
    
    
    
    
   


}
