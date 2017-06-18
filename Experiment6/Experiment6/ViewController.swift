
import UIKit

class ViewController: UIViewController {
    
    let socratesQuotes = ["An unexamined life is not worth living", "I know that I am intelligent, because I know that I know nothing.", "Wonder is the beginning of wisdom.", "Be kind, for everyone you meet is fighting a hard battle.", "Contentment is natural wealth, luxury is artificial poverty."]
    let stoicQuotes = ["True happiness is... to enjoy the present, without anxious dependence upon the future.", "We are more often frightened than hurt; and we suffer more from imagination than from reality.", "Sometimes even to live is an act of courage.",
        "All cruelty springs from weakness.", "Difficulties strengthen the mind, as labor does the body.", "What need is there to weep over parts of life? The whole of it calls for tears."]
    let nihilistQuotes = ["Life is meaningless.", "The point is there ain't no point.", "The more the universe seems comprehensible, the more it seems pointless.", "I don't think I believe in 'deep down'. I think that all you are is just the things that you do.", "The universe is a cruel, uncaring void. The key to being happy isn't a search for meaning. It's to keep yourself busy with unimportant nonsense, and eventually you'll be dead."]
    let camusQuotes = ["In the depth of winter, I finally learned that within me there lay an invincible summer.", "Nobody realizes that some people expend tremendous energy merely to be normal.", "What is a rebel? A man who says no.", "When I look at my life and its secret colours, I feel like bursting into tears.", "Blessed are the hearts that can bend; they shall never be broken.", "At the heart of all beauty lies something inhuman.", "People hasten to judge in order not to be judged themselves."]
    let sartreQuotes = ["Man is condemned to be free; because once thrown into the world, he is responsible for everything he does.",
                        "If you are lonely when you are alone, you are in bad company.", "Better to die on one's feet than to live on one's knees.", "We are our choices.", "There may be more beautiful times, but this one is ours.", "Life begins on the other side of despair."]
    let schopenhauerQuotes = ["Talent hits a target no one else can hit. Genius hits a target no one else can see.", "A man can be himself only so long as he is alone; and if he does not love solitude, he will not love freedom; for it is only when he is alone that he is really free.", "Mostly it is loss which teaches us about the worth of things.", "Every man takes the limits of his own field of vision for the limits of the world.", "We forfeit three-fourths of ourselves in order to be like other people.", "The shortness of life, so often lamented, may be the best thing about it."]
    let existentialistQuotes = ["That which does not kill us makes us stronger.", "One must still have chaos in oneself to be able to give birth to a dancing star.", "When you stare into the abyss the abyss stares back at you.", "Take it moment by moment, and you will find that we are all, as I’ve said before, bugs in amber.", "Try again. Fail again. Fail better.", "There is scarcely any passion without struggle.", "The world is, of course, nothing but our conception of it.", "Man is nothing else but what he makes of himself."]
    
    let pinchGesture = UIPinchGestureRecognizer()
    let swipeRightGesture = UISwipeGestureRecognizer()
    let swipeLeftGesture = UISwipeGestureRecognizer()
    let swipeUpGesture = UISwipeGestureRecognizer()
    let swipeDownGesture = UISwipeGestureRecognizer()
    let tapGesture = UITapGestureRecognizer()
    let doubleTapGesture = UITapGestureRecognizer()
    let longTapGesture = UILongPressGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinchGesture.addTarget(self, action: #selector(pinchedScreen))
        self.view!.addGestureRecognizer(pinchGesture)
        
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
        
        doubleTapGesture.addTarget(self, action: #selector(doubleTappedScreen))
        doubleTapGesture.numberOfTapsRequired = 2
        self.view!.addGestureRecognizer(doubleTapGesture)
        
        longTapGesture.addTarget(self, action: #selector(longTappedScreen))
        longTapGesture.minimumPressDuration = 0.5
        longTapGesture.delaysTouchesBegan = true
        self.view!.addGestureRecognizer(longTapGesture)
        
    }
    
    /*
     MARK: Gesture recognizer functions
     */
    
    // Detect pinch
    func pinchedScreen() {
        print("Pinched screen")
        self.view!.backgroundColor = UIColor.CustomColor.Gray.Payne
    }
    
    // Detect swipes
    func swipedRight() {
        print("Swiped right")
        self.view!.backgroundColor = UIColor.CustomColor.Red.Crayola
    }
    
    func swipedLeft() {
        print("Swiped left")
        self.view!.backgroundColor = UIColor.CustomColor.Black.Licorice
    }
    
    func swipedUp() {
        print("Swiped up")
        self.view!.backgroundColor = UIColor.CustomColor.Green.WinterGreen
    }
    
    func swipedDown() {
        print("Swiped down")
        self.view!.backgroundColor = UIColor.CustomColor.Pink.Queen
    }
    
    // Detect tap
    func tappedScreen() {
        print("Tapped")
        self.view!.backgroundColor = UIColor.CustomColor.White.Snow
    }
    
    // Detect double tap
    func doubleTappedScreen() {
        print("Double tap!")
        self.view!.backgroundColor = UIColor.CustomColor.Violet.Han
    }
    
    // Detect long tap
    func longTappedScreen() {
        print("Long tap")
        self.view!.backgroundColor = UIColor.CustomColor.Blue.Moonstone
    }


}

