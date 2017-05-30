
import Foundation
import Alamofire

class GhibliModel {
    
    var films = Array<Film>()
    var people = Array<People>()
    var locations = Array<Location>()
    var species = Array<Species>()
    var vehicles = Array<Vehicle>()
    
    let filmUrl = URL(string: "https://ghibliapi.herokuapp.com/films")!
    let peopleUrl = URL(string: "https://ghibliapi.herokuapp.com/people")!
    let locationUrl = URL(string: "https://ghibliapi.herokuapp.com/locations")!
    let speciesUrl = URL(string: "https://ghibliapi.herokuapp.com/species")!
    let vehicleUrl = URL(string: "https://ghibliapi.herokuapp.com/vehicles")!
    
    
    func getFilms(completed: @escaping () -> ()) {
        
        Alamofire.request(filmUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let filmData = result.value! as? [[String:Any]]
            
            for data in filmData! {
                let title = data["title"]! as? String
                let description = data["description"]! as? String
                let rtScore = data["rt_score"]! as? String
                let director = data["director"]! as? String
                let producer = data["producer"]! as? String
                let releaseDate = data["release_date"]! as? String
                
                let filmInstance = Film(title: title!, description: description!, director: director!, producer: producer!, releaseDate: releaseDate!, rtScore: rtScore!)
                
                self.films.append(filmInstance)
                
            }
            

            completed()
        })
    }
    
    func getPeople(completed: @escaping () -> ()) {
        
        Alamofire.request(peopleUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let peopleData = result.value! as? [[String:Any]]
            
            for data in peopleData! {
                
                let name = data["name"]! as? String
                let gender = data["gender"]! as? String
                let age = data["age"]! as? String
                let eyeColor = data["eye_color"]! as? String
                let hairColor = data["hair_color"]! as? String
              
                let personInstance = People(name: name!, gender: gender!, age: age!, eyeColor: eyeColor!, hairColor: hairColor!)
                
                self.people.append(personInstance)
                
            }

            
            completed()
        })
    }
    
    func getLocation(completed: @escaping () -> ()) {
        
        Alamofire.request(locationUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let locationData = result.value! as? [[String:Any]]
            
            for data in locationData! {
                
                let name = data["name"]! as? String
                let climate = data["climate"]! as? String
                let terrain = data["terrain"]! as? String
                let surfaceWater = data["surfaceWater"]! as? String
                
                let locationInstance = Location(name: name!, climate: climate!, terrain: terrain!, surfaceWater: surfaceWater!)
                
                self.locations.append(locationInstance)
                
            }
            
            
            completed()
        })
    }
    
    func getSpecies(completed: @escaping () -> ()) {
        
        Alamofire.request(speciesUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let speciesData = result.value! as? [[String:Any]]
            
            for data in speciesData! {
                
                let name = data["name"]! as? String
                let classification = data["classification"]! as? String
                let eyeColors = data["eye_colors"]! as? String
                let hairColors = data["hair_colors"]! as? String
                
                let speciesInstance = Species(name: name!, classification: classification!, eyeColors: eyeColors!, hairColors: hairColors!)
                
                self.species.append(speciesInstance)
                
            }
            
            
            completed()
        })
    }
    
    func getVehicles(completed: @escaping () -> ()) {
        
        Alamofire.request(vehicleUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let vehicleData = result.value! as? [[String:Any]]
            
            for data in vehicleData! {
                
                let name = data["name"]! as? String
                let description = data["description"] as? String
                let vehicleClass = data["vehicle_class"] as? String
                let length = data["length"]! as? String
                
                let vehicleInstance = Vehicle(name: name!, description: description!, vehicleClass: vehicleClass!, length: length!)
                
                self.vehicles.append(vehicleInstance)
                
            }
            
            
            completed()
        })
    }

    
    
}
