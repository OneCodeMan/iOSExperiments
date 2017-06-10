
import UIKit

class ViewController: UIViewController {
    
    var currRollX = 0
    var currRollY = 0
    
    @IBOutlet weak var boulder: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var mainButton: UIButton!
    
    @IBAction func mainButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1.5, options: [],
                       animations: {
                        
                        self.boulder.transform = CGAffineTransform(translationX: CGFloat(self.currRollX), y: CGFloat(-self.currRollY))
                    })
        
        currRollX += 10
        currRollY += 15
        
        if currRollX >= 230 {
            currRollX = 0
            mainLabel.text! = "Down"
            mainButton.setTitle("Down", for: .normal)
        } else {
            mainButton.setTitle("Up", for: .normal)
            mainLabel.text! = "Up"
        }
        
        if currRollY >= 345 {
            currRollY = 0
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

