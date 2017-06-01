
import UIKit

class ViewController: UIViewController {
    
    let filmController = GhibliModel()
    
    @IBAction func filmsButton(_ sender: UIButton) {
        
        filmController.getFilms {
            
            let filmsVC = self.storyboard?.instantiateViewController(withIdentifier: "Films") as! FilmsViewController
            filmsVC.films = self.filmController.films
            self.navigationController?.pushViewController(filmsVC, animated: true)
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

