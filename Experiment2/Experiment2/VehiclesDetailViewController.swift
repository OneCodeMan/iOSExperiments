
import UIKit

class VehiclesDetailViewController: UIViewController {
    
    var name: String?
    var vehicleDescription: String?
    var vehicleClass: String?
    var length: String?
    
    @IBOutlet weak var vehicleNameLabel: UILabel!
    
    @IBOutlet weak var vehicleDescriptionLabel: UILabel!
    
    @IBOutlet weak var vehicleClassLabel: UILabel!
    
    @IBOutlet weak var vehicleLengthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicleNameLabel?.text = name!
        vehicleDescriptionLabel?.text = vehicleDescription!
        vehicleClassLabel?.text = vehicleClass!
        vehicleLengthLabel?.text = length!

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
