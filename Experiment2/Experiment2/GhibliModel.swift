
import Foundation
import Alamofire

class GhibliModel {
    
    private var filmData = [[String:String]]()
    typealias JSONStandard = Dictionary<String, String>
    
    let filmUrl = URL(string: "https://ghibliapi.herokuapp.com/films")!
    let peopleUrl = URL(string: "https://ghibliapi.herokuapp.com/people")!
    
    func getFilms(completed: @escaping () -> ()) {
        
        Alamofire.request(filmUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let testData = result.value! as? [[String:Any]]
            
            print(testData![0]["release_date"]!)
            print(testData![0]["producer"]!)
            print(testData![0]["director"]!)
            print(testData![0]["rt_score"]!)
            print(testData![0]["description"]!)
            print(testData![0]["title"]!)

            completed()
        })
    }
    
    func getPeople(completed: @escaping () -> ()) {
        
        Alamofire.request(peopleUrl).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            let testData = result.value! as? [[String:Any]]
            
            print(testData![0])
            
            completed()
        })
    }
    
}
