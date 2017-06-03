
import UIKit

class FilmDetailViewController: UIViewController {
    
    var filmTitle: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var rtScore: String?
    var filmDescription: String?
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    @IBOutlet weak var producerLabel: UILabel!

    @IBOutlet weak var directorLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var rtScoreLabel: UILabel!
    
    @IBOutlet weak var filmDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitleLabel.text? = filmTitle!
        producerLabel.text? = producer!
        directorLabel.text? = director!
        releaseDateLabel.text? = releaseDate!
        rtScoreLabel.text? = rtScore!
        filmDescriptionLabel.text? = filmDescription!

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
    

}
