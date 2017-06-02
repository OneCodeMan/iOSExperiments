
import UIKit

class SpeciesViewController: UITableViewController {
    
    var species = [Species]()
    let numSpecies = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Species"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numSpecies
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Species", for: indexPath)
        
        cell.textLabel?.text = species[indexPath.row].classification
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SpeciesDetail") as? SpeciesDetailViewController {
            vc.name = species[indexPath.row].name
            vc.classification = species[indexPath.row].classification
            vc.eyeColors = species[indexPath.row].eyeColors
            vc.hairColors = species[indexPath.row].hairColors
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
