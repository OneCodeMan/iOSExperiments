
import UIKit

class PeopleDetailViewController: UIViewController {
    
    var name: String?
    var gender: String?
    var age: String?
    var eyeColor: String?
    var hairColor: String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel?.text = name!
        genderLabel?.text = gender!
        ageLabel?.text = age!
        eyeColorLabel?.text = eyeColor!
        hairColorLabel?.text = hairColor!
        
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
