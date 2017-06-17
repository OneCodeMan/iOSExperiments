
import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var villagers = [Villager]()
    var filteredVillagers = [Villager]()
    var inSearchMode = false
    
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parseJSON()
        initializeAudio()
        
    }
    
    /*
     MARK: Collection View info
     */

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillagerCell", for: indexPath) as? VillagerCell {
            
            let villager: Villager!
            
            if inSearchMode {
                
                villager = filteredVillagers[indexPath.row]
                
            } else {
            
                villager = villagers[indexPath.row]
                
            }
            
            cell.updateCell(villager: villager)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var villager: Villager!
        
        if inSearchMode {
            villager = filteredVillagers[indexPath.row]
        } else {
            villager = villagers[indexPath.row]
        }
        
        performSegue(withIdentifier: "VillagerDetailVC", sender: villager)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredVillagers.count
        }
        
        return villagers.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 115, height: 115)
    }
    
    /*
     MARK: Audio
     */
    
    func initializeAudio() {
        let path = Bundle.main.path(forResource: "themeSong", ofType: "mp3")!
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func musicButtonTapped(_ sender: UIButton) {
        
        if musicPlayer.isPlaying {
            
            musicPlayer.pause()
            sender.alpha = 0.2
        } else {
            
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    /*
    MARK: Search bar
    */
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
            
        } else {
            
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredVillagers = villagers.filter({ $0.name.range(of: lower) != nil })
            collectionView.reloadData()
            
        }
    }
    
    /*
     MARK: JSON Parser
     */
    
    func parseJSON() {
        let fm = FileManager.default
        let path = Bundle.main.path(forResource: "ac", ofType: "json")
        let pathContent = try! fm.contents(atPath: path!)
        
        do {
            let villagerObjects = try JSONSerialization.jsonObject(with: pathContent!, options: []) as? [[String: Any]]
            
            for item in villagerObjects! {
                
                let villagerId = item["id"]! as? Int
                let name = item["name"]! as? String
                let personality = item["personality"]! as? String
                let species = item["species"]! as? String
                let birthday = item["birthday"]! as? String
                let catchphrase = item["catchphrase"]! as? String
                
                let villagerInstance = Villager(villagerId: villagerId!, name: name!, personality: personality!, species: species!, birthday: birthday!, catchphrase: catchphrase!)
                
                self.villagers.append(villagerInstance)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    /*
     MARK: Segue
     */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VillagerDetailVC" {
            if let detailsVC = segue.destination as? VillagerDetailVC {
                if let villager = sender as? Villager {
                    detailsVC.villager = villager
                }
            }
        }
    }
    
}

