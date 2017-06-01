
import UIKit

class VehiclesViewController: UITableViewController {
    
    var vehicles = [Vehicle]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vehicles"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Vehicle", for: indexPath)
        
        cell.textLabel?.text = vehicles[indexPath.row].name
        
        return cell
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
