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
            static let PaleViolet = UIColor.init(hex: 0xCAA8F5)
            static let DarkPastel = UIColor.init(hex: 0x9984D4)
            static let Regalia = UIColor.init(hex: 0x592E83)
            static let Han = UIColor.init(hex: 0x6610F2)
        }
        
        struct Red {
            static let Crayola = UIColor.init(hex: 0xED254E)
            static let Burgundy = UIColor.init(hex: 0x720026)
            static let SpanishCarmine = UIColor.init(hex: 0xD11149)
        }
        
        struct Blue {
            static let Vista = UIColor.init(hex: 0x7D80DA)
            static let Lapis = UIColor.init(hex: 0x1C5D99)
            static let Moonstone = UIColor.init(hex: 0x75B9BE)
            static let Baby = UIColor.init(hex: 0x9DD1F1)
            static let PaleAqua = UIColor.init(hex: 0x84D4EE)
            static let Azure = UIColor.init(hex: 0x3ABEFF)
            static let Livid = UIColor.init(hex: 0x6699CC)
        }
        
        struct Yellow {
            static let Stil = UIColor.init(hex: 0xF7C35B)
            static let Flax = UIColor.init(hex: 0xE1DD8F)
            static let GoldenRod = UIColor.init(hex: 0xEEEFA8)
            static let Pale = UIColor.init(hex: 0xF3FFC6)
            static let Sunny = UIColor.init(hex: 0xFFF275)
        }
        
        struct Green {
            static let Asparagus = UIColor.init(hex: 0x87A878)
            static let WinterGreen = UIColor.init(hex: 0x4E937A)
            static let Middle = UIColor.init(hex: 0x4B7F52)
            static let Tea = UIColor.init(hex: 0xC4FFB2)
            static let Mindaro = UIColor.init(hex: 0xD6F7A3)
        }
        
        struct Pink {
            static let Queen = UIColor.init(hex: 0x3DD2E0)
            static let Magenta = UIColor.init(hex: 0xD30C7B)
            static let Paradise = UIColor.init(hex: 0xE63462)
        }
        
        struct Gray {
            static let Payne = UIColor.init(hex: 0x546A76)
            static let Jet = UIColor.init(hex: 0x353535)
            static let Cadet = UIColor.init(hex: 0x5C6672)
            static let Trolley = UIColor.init(hex: 0x7C7C7C)
        }
        
        struct White {
            static let Snow = UIColor.init(hex: 0xFFFBFC)
            static let Floral = UIColor.init(hex: 0xFFF8F0)
        }
        
        struct Black {
            static let Licorice = UIColor.init(hex: 0x171219)
        }
        
    }
    
}

