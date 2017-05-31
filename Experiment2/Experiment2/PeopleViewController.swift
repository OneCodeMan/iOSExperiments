
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
