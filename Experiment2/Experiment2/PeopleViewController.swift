
import UIKit

class PeopleViewController: UIViewController {
    
    let peopleController = GhibliModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        peopleController.getPeople {
            
            for person in self.peopleController.people {
                // display on UI
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
