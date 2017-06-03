
import UIKit

class ViewController: UIViewController {
    
    let gm = GhibliModel()
    
    @IBAction func shrinkButton(_ sender: UIButton) {
        print("shrink")
        UIView.animate(withDuration: 0.2,
                       animations: {
                sender.transform = CGAffineTransform(scaleX: 0.01, y: 1)
        },
            completion: { _ in
                UIView.animate(withDuration: 0.5) {
                    sender.transform = CGAffineTransform.identity
                }
        })
    }
    
    @IBAction func filmsButton(_ sender: UIButton) {
        
        print("Films button pressed!")
        
        gm.getFilms {
            
            let filmsVC = self.storyboard?.instantiateViewController(withIdentifier: "Films") as! FilmsViewController
            filmsVC.films = self.gm.films
            self.navigationController?.pushViewController(filmsVC, animated: true)
            
        }

        
    }
    
    @IBAction func peopleButton(_ sender: UIButton) {
        
        print("People button pressed")
        
        gm.getPeople {
            
            let peopleVC = self.storyboard?.instantiateViewController(withIdentifier: "People") as! PeopleViewController
            peopleVC.people = self.gm.people
            self.navigationController?.pushViewController(peopleVC, animated: true)
            
        }

        
    }

    @IBAction func locationsButton(_ sender: UIButton) {
        
        print("Locations button pressed!")
        
        gm.getLocations {
            
            print("getLocations closure called")
            
            let locationsVC = self.storyboard?.instantiateViewController(withIdentifier: "Locations") as! LocationsViewController
            locationsVC.locations = self.gm.locations
            self.navigationController?.pushViewController(locationsVC, animated: true)
            
        }

    }
    
    @IBAction func speciesButton(_ sender: UIButton) {
    
        print("Species button pressed!")
        
        gm.getSpecies {
            
            let speciesVC = self.storyboard?.instantiateViewController(withIdentifier: "Species") as! SpeciesViewController
            speciesVC.species = self.gm.species
            self.navigationController?.pushViewController(speciesVC, animated: true)
            
        }

        
    }
    
    @IBAction func vehiclesButton(_ sender: UIButton) {
        
        print("Vehicles button pressed!")
        
        gm.getVehicles {
            
            let vehiclesVC = self.storyboard?.instantiateViewController(withIdentifier: "Vehicles") as! VehiclesViewController
            vehiclesVC.vehicles = self.gm.vehicles
            self.navigationController?.pushViewController(vehiclesVC, animated: true)
            
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

