
import UIKit

class SpeciesDetailViewController: UIViewController {
    
    var name: String?
    var classification: String?
    var eyeColors: String?
    var hairColors: String?
    
    @IBOutlet weak var speciesNameLabel: UILabel!
    
    @IBOutlet weak var classificationLabel: UILabel!
    
    @IBOutlet weak var eyeColorsLabel: UILabel!
    
    @IBOutlet weak var hairColorsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        speciesNameLabel?.text = name!
        classificationLabel?.text = classification!
        eyeColorsLabel?.text = eyeColors!
        hairColorsLabel?.text = hairColors!
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
