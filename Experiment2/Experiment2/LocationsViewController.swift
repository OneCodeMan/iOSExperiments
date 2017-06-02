
import UIKit

class LocationsViewController: UITableViewController {
    
    var locations = [Location]()
    let numLocations = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Locations"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numLocations
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Location", for: indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "LocationDetail") as? LocationsDetailViewController {
            vc.name = locations[indexPath.row].name
            vc.climate = locations[indexPath.row].climate
            vc.terrain = locations[indexPath.row].terrain
            vc.surfaceWater = locations[indexPath.row].surfaceWater
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
