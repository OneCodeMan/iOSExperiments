
import UIKit

class SpeciesViewController: UIViewController {
    
    let speciesController = GhibliModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        speciesController.getSpecies {
            
            for species in self.speciesController.species {
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
