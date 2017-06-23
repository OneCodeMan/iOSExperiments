import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat? = 1.0) {
        let hexRed = CGFloat((hex >> 16) & 0xff) / 255.0
        let hexGreen = CGFloat((hex >> 8) & 0xff) / 255.0
        let hexBlue = CGFloat(hex & 0xff) / 255.0
        let alphaValue = alpha ?? 1.0
        
        self.init(red: hexRed, green: hexGreen, blue: hexBlue, alpha: alphaValue)
    }
    
    struct CustomColor {
        
        struct Violet {
            static let PastelPurple = UIColor.init(hex: 0x907AD6)
        }
        
        struct Red {
            static let Crayola = UIColor.init(hex: 0xED254E)
        }
        
        struct Blue {
            static let BlueGreen = UIColor.init(hex: 0x119DA4)
            
        }
        
    }
    
}


