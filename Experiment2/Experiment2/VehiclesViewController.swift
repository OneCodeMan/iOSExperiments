
import UIKit

class VehiclesViewController: UITableViewController {
    
    var vehicles = [Vehicle]()
    let numVehicles = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vehicles"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numVehicles
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Vehicle", for: indexPath)
        
        cell.textLabel?.text = vehicles[indexPath.row].name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VehicleDetail") as? VehiclesDetailViewController {
            vc.name = vehicles[indexPath.row].name
            vc.vehicleDescription = vehicles[indexPath.row].description
            vc.vehicleClass = vehicles[indexPath.row].vehicleClass
            vc.length = vehicles[indexPath.row].length
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
