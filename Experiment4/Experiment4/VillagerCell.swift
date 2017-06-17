
import UIKit

class VillagerCell: UICollectionViewCell {
    
    @IBOutlet weak var villagerImage: UIImageView!
    @IBOutlet weak var villagerNameLabel: UILabel!
    
    var villager: Villager!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        layer.cornerRadius = 7.0
    }
    
    func updateCell(villager: Villager) {
        self.villager = villager
        
        villagerNameLabel.text = self.villager.name.capitalized
        villagerImage.image = UIImage(named: "\(self.villager.villagerId)")
        
    }
    
}
