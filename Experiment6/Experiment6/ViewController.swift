
import UIKit

class ViewController: UIViewController {
    
    let swipeRightGesture = UISwipeGestureRecognizer()
    let swipeLeftGesture = UISwipeGestureRecognizer()
    let swipeUpGesture = UISwipeGestureRecognizer()
    let swipeDownGesture = UISwipeGestureRecognizer()
    let tapGesture = UITapGestureRecognizer()
    let longTapGesture = UILongPressGestureRecognizer()
    let pinchGesture = UIPinchGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeRightGesture.addTarget(self, action: #selector(swipedRight))
        swipeRightGesture.direction = .right
        self.view!.addGestureRecognizer(swipeRightGesture)
        
        swipeLeftGesture.addTarget(self, action: #selector(swipedLeft))
        swipeLeftGesture.direction = .left
        self.view!.addGestureRecognizer(swipeLeftGesture)
        
        swipeUpGesture.addTarget(self, action: #selector(swipedUp))
        swipeUpGesture.direction = .up
        self.view!.addGestureRecognizer(swipeUpGesture)
        
        swipeDownGesture.addTarget(self, action: #selector(swipedDown))
        swipeDownGesture.direction = .down
        self.view!.addGestureRecognizer(swipeDownGesture)
    
        tapGesture.addTarget(self, action: #selector(tappedScreen))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.view!.addGestureRecognizer(tapGesture)
        
        longTapGesture.addTarget(self, action: #selector(longTappedScreen))
        longTapGesture.minimumPressDuration = 0.5
        longTapGesture.delaysTouchesBegan = true
        self.view!.addGestureRecognizer(longTapGesture)
        
        pinchGesture.addTarget(self, action: #selector(pinchedScreen))
        self.view!.addGestureRecognizer(pinchGesture)
        
        
    }
    
    // Detect swipes
    func swipedRight() {
        print("Swiped right")
    }
    
    func swipedLeft() {
        print("Swiped left")
    }
    
    func swipedUp() {
        print("Swiped up")
    }
    
    func swipedDown() {
        print("Swiped down")
    }
    
    // Detect tap
    func tappedScreen() {
        print("Tapped")
    }
    
    // Detect long tap
    func longTappedScreen() {
        print("Long tap")
    }
    
    // Detect pinch 
    func pinchedScreen() {
        print("Pinched screen")
    }

}

