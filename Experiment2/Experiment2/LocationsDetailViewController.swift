
import UIKit

class LocationsDetailViewController: UIViewController {
    
    var name: String?
    var climate: String?
    var terrain: String?
    var surfaceWater: String?
    
    @IBOutlet weak var terrainLabel: UILabel!
    
    @IBOutlet weak var surfaceWaterLabel: UILabel!
    
    @IBOutlet weak var climateLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel?.text = name!
        terrainLabel?.text = terrain!
        climateLabel?.text = climate!
        surfaceWaterLabel?.text = surfaceWater!
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
