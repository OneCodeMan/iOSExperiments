
import Foundation
import Alamofire

class GhibliModel {
    
    private var filmData = [[String:String]]()
    typealias JSONStandard = Dictionary<String, String>
    
    let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
    
    func downloadData(completed: @escaping () -> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            if let testData = result.value! as? JSONStandard, let description = testData["description"] as? String {
                print(description)
            } else {
                print("naw")
            }
            
            completed()
        })
    }
    
}
