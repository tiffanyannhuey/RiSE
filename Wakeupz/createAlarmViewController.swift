import UIKit
import CoreData

class createAlarmViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var earliestWakeupTime: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var isOn: UISwitch!

    var obligations: [Obligation] = []
    var obligationSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        earliestWakeupTime.setValue(UIColor.white, forKeyPath: "textColor")
        self.showAlert()
    }
    
    func getData() {
        
        let obligationFetch: NSFetchRequest<Obligation> = Obligation.fetchRequest()
        let obligationSort = NSSortDescriptor(key: "createdAt", ascending: false)
        obligationFetch.sortDescriptors = [obligationSort]
        
        do {
            obligations = try context.fetch(obligationFetch)
        } catch {
            print("Fetching failed")
        }
    }
    
    func removeNilValues(arrayOf: inout [Obligation]) -> [Obligation] {
        for element in arrayOf {
            if element.name == nil {
                var index = arrayOf.index(of: element)
                arrayOf.remove(at: index!)
            }
        }
        return arrayOf
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        obligations = removeNilValues(arrayOf: &obligations)
        picker.reloadAllComponents()
    }
    
//    Setup for location picker 
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: obligations[row].name!, attributes: [NSForegroundColorAttributeName:UIColor.white])
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let obligation = obligations[row]
        return obligation.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return obligations.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        obligationSelection = row
    }
    
    func calculateWakeup() {
        
        /* algorithm for calculating wake up time. function should return wake up time to
         to be stored in Core data */
    }
    
    func setAlarmValues() {
        let alarm = NSEntityDescription.insertNewObject(forEntityName: "Alarm", into: self.context)
        
        // let updatedWakeupTime = calculateWakeup()
        // remember to remove Date() from below
        alarm.setValue(Date(), forKey: "calculatedWakeup")
        alarm.setValue(earliestWakeupTime.date, forKey: "earliestWakeup")
        alarm.setValue(true, forKey: "isSmart")
        
        let obligationSelected = obligations[obligationSelection]
        alarm.setValue(obligationSelected, forKey: "obligation")
        alarm.setValue(Date(), forKey: "createdAt")
    }
    
    
    @IBAction func handleAddNewAlarm(_ sender: UIButton) {
        setAlarmValues()
        
        do {
            try context.save()
        } catch {
        }
    }
    

    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Where you goin'?", message: "Where is your event located? If you don't see your destination, add one by tapping 'Create new destination'.", preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
   
//    @IBAction func scrollDown(_ sender: UIButton) {
//        self.view.bounds.setContentOffset(CGPoint(x: 100, y: 200), animated: true)
//
//    }
}
