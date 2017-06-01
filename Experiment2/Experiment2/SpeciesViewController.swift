
import UIKit

class SpeciesViewController: UITableViewController {
    
    var species = [Species]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Species"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return species.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Species", for: indexPath)
        
        cell.textLabel?.text = species[indexPath.row].classification
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
