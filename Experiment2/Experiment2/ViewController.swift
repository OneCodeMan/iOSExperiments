
import UIKit

class ViewController: UIViewController {
    
    var ghibli = GhibliModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ghibli.getFilms {
            self.updateConsole()
        }
        
        ghibli.getPeople {
            self.updateConsole()
        }
       
    }
    
    func updateConsole() {
        return
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

