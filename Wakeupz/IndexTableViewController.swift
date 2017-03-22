import UIKit


class IndexTableViewController: UITableViewController {
    
    var alarms: [Alarm] = []
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        self.tableView.reloadData()
        let navBar = view as? UINavigationBar
        navBar?.tintColor = UIColor.darkGray
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
        
        cell.timeLabel.text = earliestWakeupString
        

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
    
    @IBAction func whiten() {
        print("You're inside the whiten function")
        print("It located the nav bar")
        let navBar = view as? UINavigationBar
        navBar?.tintColor = UIColor.red 
        print("It worked")
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Hi there!", message: "After, tapping the 'OK' button below, tap the '+' button on the top-right corner to get started.", preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {action in self.whiten()
        })
        
//        func myHandler(alert: UIAlertAction){
//            print("You tapped: \(alert.title)")
//        }
        
//        let callFunction = UIAlertAction(title: "Call Function", style: UIAlertActionStyle.default, handler: myHandler)
        
        
        alertController.addAction(defaultAction)
//        alertController.addAction(turnWhite)
//        alertController.addAction(callFunction)
        
        present(alertController, animated: true, completion: nil)
        
    }

    
}
