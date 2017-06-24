import UIKit

class ChooseShakeController: UIViewController {
    
    @IBOutlet weak var vanillaFlavourLabel: UILabel!
    @IBOutlet weak var vanillaFlavourCheckbox: BEMCheckBox!
    
    @IBOutlet weak var chocolateFlavourLabel: UILabel!
    @IBOutlet weak var chocolateFlavourCheckbox: BEMCheckBox!
    
    @IBOutlet weak var strawberryFlavourLabel: UILabel!
    @IBOutlet weak var strawberryFlavourCheckbox: BEMCheckBox!
    
    @IBOutlet weak var dietaryCarbsCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryCarbsLabel: UILabel!
    @IBOutlet weak var dietaryProteinCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryProteinLabel: UILabel!
    @IBOutlet weak var dietarySugarCheckbox: BEMCheckBox!
    @IBOutlet weak var dietarySugarLabel: UILabel!
    @IBOutlet weak var dietaryVeganCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryVeganLabel: UILabel!
    
    @IBAction func orderButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dietaryCarbsCheckbox.boxType = .square
        dietaryProteinCheckbox.boxType = .square
        dietarySugarCheckbox.boxType = .square
        dietaryVeganCheckbox.boxType = .square
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}

