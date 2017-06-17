
import Foundation

struct Villager {
    
    fileprivate var _villagerId: Int!
    fileprivate var _name: String!
    fileprivate var _personality: String!
    fileprivate var _species: String!
    fileprivate var _birthday: String!
    fileprivate var _catchphrase: String!
    
    var villagerId: Int {
        return _villagerId
    }
    
    var name: String {
        return _name.lowercased()
    }
    
    var personality: String {
        return _personality
    }
    
    var species: String {
        return _species
    }
    
    var birthday: String {
        return _birthday
    }
    
    var catchphrase: String {
        return _catchphrase
    }
    
    init(villagerId: Int, name: String, personality: String, species: String, birthday: String, catchphrase: String) {
        
        self._villagerId = villagerId
        self._name = name
        self._personality = personality
        self._species = species
        self._birthday = birthday
        self._catchphrase = catchphrase
        
    }
    
}

extension Villager {
    init?(json: [String: Any]) {
        guard let villagerId = json["villagerId"] as? Int,
            let name = json["name"] as? String,
            let personality = json["personality"] as? String,
            let species = json["species"] as? String,
            let birthday = json["birthday"] as? String,
            let catchphrase = json["catchphrase"] as? String
        
        else {
            return nil
        }
        
        self._villagerId = villagerId
        self._name = name
        self._personality = personality
        self._species = species
        self._birthday = birthday
        self._catchphrase = catchphrase
        
    }
    
    
}








