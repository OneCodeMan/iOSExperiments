
import UIKit

class FilmsViewController: UITableViewController {
    
    let filmController = GhibliModel()
    var films = [Film]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Films"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Film", for: indexPath)
        
        cell.textLabel?.text = films[indexPath.row].title
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
