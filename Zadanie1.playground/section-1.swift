import UIKit

struct Coordinate
{
    var latitude: Float = 0
    var longitude: Float = 0
}

struct Address
{
    var street: String = ""
    var city: String = ""
    var country: String = ""
}

class PointOfInterest
{
    var coordinate = Coordinate()
    var address = Address()
    var name: String = ""
    
    init(name: String)
    {
        self.name = name
    }
    
    func poidescription() -> String
    {
        return ("\(name) - (\(coordinate.latitude), \(coordinate.longitude)) - \(address.street), \(address.city), \(address.country)")
    }
}

var punkt = PointOfInterest(name: "Kino")
punkt.coordinate = Coordinate(latitude: 53.428544, longitude: 14.552812);
punkt.address = Address(street: "al. Wojska Polskiego", city: "Szczecin", country: "Polska")
punkt.poidescription()