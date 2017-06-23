import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var frontViewCategory: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backViewPrompt: UILabel!
    
    var knowYourselfQuestions = ["knowyourself0", "knowyourself1", "knowyourself2", "knowyourself3", "knowyourself4", "knowyourself5"]
    var daringQuestions = ["daring0", "daring1", "daring2", "daring3", "daring4", "daring5", "daring6", "daring7"]
    var vulnerabilityQuestions = ["vulernability0", "vulernability1", "vulernability2", "vulernability3", "vulernability4", "vulernability5", "vulernability6", "vulernability7"]
    var categories = ["Know Yourself", "Daring", "Vulnerability"]
    var colors = [UIColor.CustomColor.Violet.PastelPurple, UIColor.CustomColor.Red.Crayola, UIColor.CustomColor.Blue.BlueGreen]
    var prompts: [[String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prompts = [knowYourselfQuestions, daringQuestions, vulnerabilityQuestions]
        frontView.backgroundColor = UIColor.black
        frontViewCategory.text = "Reflections"
        backViewPrompt.text = "Prompts to get to know yourself."
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
