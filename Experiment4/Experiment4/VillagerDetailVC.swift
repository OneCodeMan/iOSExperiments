
import UIKit

class VillagerDetailVC: UIViewController {
    
    var villager: Villager!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var villagerImageView: UIImageView!
    @IBOutlet weak var catchphraseLabel: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = villager.name.capitalized
        catchphraseLabel.text = "\"\(villager.catchphrase)\""
        speciesLabel.text = villager.species
        birthdayLabel.text = villager.birthday
        villagerImageView.image = UIImage(named: "\(villager.villagerId)")
        
    }


}
