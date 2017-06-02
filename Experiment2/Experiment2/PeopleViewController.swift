
import UIKit

class PeopleViewController: UITableViewController {
    
    var people = [People]()
    let numPeople = 29

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "People"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numPeople
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row].name
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PeopleDetail") as? PeopleDetailViewController {
            vc.name = people[indexPath.row].name
            vc.gender = people[indexPath.row].gender
            vc.age = people[indexPath.row].age
            vc.eyeColor = people[indexPath.row].eyeColor
            vc.hairColor = people[indexPath.row].hairColor
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
