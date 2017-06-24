
import UIKit

class OrderedShakeViewController: UIViewController {

    @IBOutlet weak var orderInformationLabel: UILabel!
    
    var chosenSize: String = "medium"
    var chosenFlavour: String = "chocolate"
    var chosenDietary: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chosenDietaryString = "With \(chosenDietary.joined(separator: ", "))."
        let withString = chosenDietary.isEmpty ? "" : chosenDietaryString
        
        orderInformationLabel.text = "You ordered a \(chosenSize) \(chosenFlavour) shake. \(withString)"
    }
    
}
