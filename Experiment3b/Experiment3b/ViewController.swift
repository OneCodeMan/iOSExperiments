import UIKit

class ViewController: UICollectionViewController {
    
    let heroList = [#imageLiteral(resourceName: "hero-ww"), #imageLiteral(resourceName: "hero-socrates"), #imageLiteral(resourceName: "hero-yuno"), #imageLiteral(resourceName: "hero-batman"), #imageLiteral(resourceName: "hero-camus"),
                    #imageLiteral(resourceName: "hero-gintoki"), #imageLiteral(resourceName: "hero-diogenes"), #imageLiteral(resourceName: "hero-daredevil"), #imageLiteral(resourceName: "hero-saitama"),
                    #imageLiteral(resourceName: "hero-erza")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose a Hero"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Hero", for: indexPath) as! HeroCell
        cell.heroImageView.image = heroList[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero = heroList[indexPath.item]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

