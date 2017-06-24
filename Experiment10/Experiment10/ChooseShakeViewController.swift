import UIKit

class ChooseShakeController: UIViewController, BEMCheckBoxDelegate {
    
    @IBOutlet weak var sizeSmallCheckbox: BEMCheckBox!
    @IBOutlet weak var sizeMediumCheckbox: BEMCheckBox!
    @IBOutlet weak var sizeLargeCheckbox: BEMCheckBox!
    var sizeOption: String?
    
    @IBOutlet weak var vanillaFlavourLabel: UILabel!
    @IBOutlet weak var vanillaFlavourCheckbox: BEMCheckBox!
    @IBOutlet weak var chocolateFlavourLabel: UILabel!
    @IBOutlet weak var chocolateFlavourCheckbox: BEMCheckBox!
    @IBOutlet weak var strawberryFlavourLabel: UILabel!
    @IBOutlet weak var strawberryFlavourCheckbox: BEMCheckBox!
    var flavourOption: String?
    
    @IBOutlet weak var dietaryCarbsCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryCarbsLabel: UILabel!
    @IBOutlet weak var dietaryProteinCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryProteinLabel: UILabel!
    @IBOutlet weak var dietarySugarCheckbox: BEMCheckBox!
    @IBOutlet weak var dietarySugarLabel: UILabel!
    @IBOutlet weak var dietaryVeganCheckbox: BEMCheckBox!
    @IBOutlet weak var dietaryVeganLabel: UILabel!
    
    var sizeCheckBoxes: [BEMCheckBox]?
    var flavourCheckBoxes: [BEMCheckBox]?
    var dietaryCheckBoxes: [BEMCheckBox]?
    
    let sizes: [String] = ["small", "medium", "large"]
    let flavours: [String] = ["vanilla", "chocolate", "strawberry"]
    let dietary: [String] = ["no carbs", "no sugar", "high protein", "vegan"]
    
    @IBAction func orderButton(_ sender: UIButton) {
        
        var selectedChoices: [String] = []
        for (index, choice) in dietaryCheckBoxes!.enumerated() where choice.on == true {
            selectedChoices.append(dietary[index])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeCheckBoxes = [sizeSmallCheckbox, sizeMediumCheckbox, sizeLargeCheckbox]
        flavourCheckBoxes = [vanillaFlavourCheckbox, chocolateFlavourCheckbox, strawberryFlavourCheckbox]
        dietaryCheckBoxes = [dietaryCarbsCheckbox, dietaryProteinCheckbox, dietarySugarCheckbox, dietaryVeganCheckbox]
        
        sizeSmallCheckbox.delegate = self
        sizeMediumCheckbox.delegate = self
        sizeLargeCheckbox.delegate = self
        
        vanillaFlavourCheckbox.delegate = self
        chocolateFlavourCheckbox.delegate = self
        strawberryFlavourCheckbox.delegate = self
        dietaryCarbsCheckbox.delegate = self
        dietaryProteinCheckbox.delegate = self
        dietarySugarCheckbox.delegate = self
        dietaryVeganCheckbox.delegate = self
        
        dietaryCarbsCheckbox.boxType = .square
        dietaryProteinCheckbox.boxType = .square
        dietarySugarCheckbox.boxType = .square
        dietaryVeganCheckbox.boxType = .square
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        let tag = checkBox.tag
        
        switch tag {
        case 0...2:
            toggleSize(of: tag)
            sizeOption = sizes[tag]
        case 3...5:
            toggleFlavour(of: tag)
            flavourOption = flavours[tag-3]
        case 6...9:
           print("Dietary")
        default:
            break
        }
        
    }
    
    /*
     MARK: TAP HELPERS
    */
    func toggleSize(of sizeTag: Int) {
        
        for box in sizeCheckBoxes! where box.tag != sizeTag {
            box.on = false
        }
        
    }
    
    func toggleFlavour(of flavourTag: Int) {
        
        for box in flavourCheckBoxes! where box.tag != flavourTag {
            box.on = false
        }
        
    }
    
    
    /*
     MARK: ORIENTATION LOGIC
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}

