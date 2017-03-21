import UIKit


class IndexTableViewController: UITableViewController {
    
    var alarms: [Alarm] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        self.showAlert()
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            alarms = try context.fetch(Alarm.fetchRequest())
            print("That is sooo fetch")
        } catch {
            print("Fetching failed")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return alarms.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! CustomIndexCell
        
        cell.placeLabel.text = alarms[indexPath.row].obligation?.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let earliestWakeupString = dateFormatter.string(for: alarms[indexPath.row].earliestWakeup)
        

        cell.toggleAlarm.onTintColor = UIColor(red: (20/255.0), green: (95/255.0), blue: (244/255.0), alpha: 1.0)
        cell.toggleAlarm.tintColor = UIColor(red: (20/255.0), green: (95/255.0), blue: (244/255.0), alpha: 1.0)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.alarms.remove(at: indexPath.row)
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
