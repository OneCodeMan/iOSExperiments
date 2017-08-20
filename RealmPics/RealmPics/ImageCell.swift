import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func updateCell() {
        print("yo")
    }
    
}
