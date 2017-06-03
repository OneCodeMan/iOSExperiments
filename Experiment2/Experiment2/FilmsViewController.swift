
import UIKit

class FilmsViewController: UITableViewController {
    
    var films = [Film]()
    let numFilms = 20 // bad workaroud

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Films"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numFilms
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Film", for: indexPath)
        
        cell.textLabel?.text = films[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FilmDetail") as? FilmDetailViewController {
            vc.filmTitle = films[indexPath.row].title
            vc.filmDescription = films[indexPath.row].description
            vc.director = films[indexPath.row].director
            vc.producer = films[indexPath.row].producer
            vc.releaseDate = films[indexPath.row].releaseDate
            vc.rtScore = films[indexPath.row].rtScore
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
