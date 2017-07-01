import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var frontViewCategory: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backViewPrompt: UILabel!
    
    var knowYourselfQuestions = ["knowyourselfknowyourselfknowyourselfknowyourselfknowyourself0", "knowyourselfknowyourselfknowyourselfknowyourselfknowyourself1", "knowyourselfknowyourselfknowyourselfknowyourselfknowyourself2", "knowyourselfknowyourselfknowyourselfknowyourselfknowyourselfknowyourself3", "knowyourselfknowyourselfknowyourselfknowyourselfknowyourself4", "knowyourselfknowyourselfknowyourselfknowyourselfknowyourselfknowyourselfknowyourselfknowyourselfknowyourself5"]
    var daringQuestions = ["daringdaringdaringdaringdaringdaringdaringdaring0", "daridaringdaringdaringdaringdaringng1", "darindaringdaringlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrindaringg2", "darindaringdalityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinringdaringdaringg3", "dadarvulernabilityvulernabilityingdaringring4", "daridaringdaringdaringdaringdaringdaringdaringdaringng5", "darindaringdarinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringringdaringg6", "daridarilityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinlityingdaringrinngdaringng7"]
    var vulnerabilityQuestions = ["vulernabilityvulernabilityvulernabilityvulernabilityvulernability0", "vulernavulernabilityvulernabilityvulernabilityvulernabilitybility1", "vulervulernabilererererereritynability2", "vulervulernabilityvulernabilityvulernabilitynability3", "vulernavulernabilityvulernabilityvulernabilityvulernabilerereritybility4", "vulvulernabilityvulernabilityvulernabilityvulernabilityvulernabilityvulernabilityvulernabilityernability5", "vulervulernaerererererererererererererverererererbilitynability6", "vulernabilvulernabilityvulernabilityvulernabilityvulernabilityvulernabilityity7"]
    var categories = ["Question", "Prompt"]
    var colors = [UIColor.CustomColor.Violet.PastelPurple, UIColor.CustomColor.Red.Crayola, UIColor.CustomColor.Blue.BlueGreen]
    var prompts: [[String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prompts = [knowYourselfQuestions, daringQuestions, vulnerabilityQuestions]
        frontView.backgroundColor = UIColor.black
        frontViewCategory.text = "Reflections"
        backViewPrompt.text = "Get to know yourself."
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if (event?.subtype == UIEventSubtype.motionShake) {
            
            UIView.transition(from: backView!, to: frontView!, duration: 0.5, options: [.transitionCurlUp, .showHideTransitionViews])
            
            print("Shook")
            let indexCategory = generateRandomIndex(for: categories)
            //print(indexCategory)
            let indexPrompt = generateRandomIndex(for: prompts[indexCategory])
            //print(indexPrompt)
            frontView.backgroundColor = colors[indexCategory]
            frontViewCategory.text = categories[indexCategory].uppercased()
            backViewPrompt.text = prompts[indexCategory][indexPrompt]
        }
    }
    
    @IBAction func swapView(_ sender: UIButton) {
        
        UIView.transition(from: frontView!, to: backView!, duration: 0.7, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
    
    /*
     MARK: Helper functions
    */
    func generateRandomIndex(for list: [String]) -> Int {
        return Int(arc4random_uniform(UInt32((list.count-1) + 1)))
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
