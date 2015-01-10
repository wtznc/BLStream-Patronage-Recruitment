///Zadanie 3 - BLS Patronage G: iOS
///Wojciech Tyziniec

import Darwin

struct Coordinate
{
    var latitude: Float = 0;
    var longitude: Float = 0;
    
    static func distanceBetweenCoordinates(aCoordinate: Coordinate, bCoordinate:Coordinate) -> Float
    {
        let π: Float = Float(M_PI)
        
        var aLatitudeRad = aCoordinate.latitude * π/180
        var aLongitudeRad = aCoordinate.longitude * π/180
        var bLatitudeRad = bCoordinate.latitude * π/180
        var bLongitudeRad = bCoordinate.longitude * π/180
        
        var dLat = bLatitudeRad - aLatitudeRad
        var dLon = bLongitudeRad - aLongitudeRad
        
        var a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(aLatitudeRad) * cos(bLatitudeRad)
        var c = Float(2 * asin(sqrt(a)))
        var R = Float(6372.8)
        
        return R * c
    }

}

struct Address
{
    var street: String = ""
    var city: String = ""
    var country: String = ""
    
    //Jaka jest różnica gdybym chciał zainicjować zmienną w sposób "var foo = String()" ?
    //Która forma jest poprawna?
}

class PointOfInterest
{
    var coordinate = Coordinate()
    var address = Address()
    var name: String = ""
    
    init(name: String, _coordinate : Coordinate, _address : Address)
    {
        self.name = name
        coordinate = _coordinate
        address = _address
    }
    
    func poidescription() -> String
    {
        return ("\(name) - (\(coordinate.latitude), \(coordinate.longitude)) - \(address.street), \(address.city), \(address.country)")
    }
}

var BLSOffice = PointOfInterest(name: "BLStream Office", _coordinate: Coordinate(latitude: 53.429204,longitude: 14.556324), _address: Address(street: "Plac Hołdu Pruskiego", city: "Szczecin", country: "Poland"))

var TPomerania = PointOfInterest(name: "Technopark Pomerania", _coordinate: Coordinate(latitude: 53.449227,longitude: 14.537591), _address: Address(street: "Niemierzyńska", city: "Szczecin", country: "Poland"))

var CHKaskada = PointOfInterest(name: "Centrum Handlowe Kaskada", _coordinate: Coordinate(latitude: 53.428494,longitude: 14.551453), _address: Address(street: "Aleja Niepodległości", city: "Szczecin", country: "Poland"))

var MakKwak = PointOfInterest(name: "MakKwak", _coordinate: Coordinate(latitude: 53.428878,longitude: 14.554291), _address: Address(street: "Plac Żołnierza Polskiego", city: "Szczecin", country: "Poland"))

var poiArray: [PointOfInterest] = [BLSOffice, TPomerania, CHKaskada, MakKwak]
var nearBLS = [PointOfInterest]();
var test = Coordinate.distanceBetweenCoordinates(poiArray[0].coordinate, bCoordinate: poiArray[1].coordinate);

for var index = 0; index <= poiArray.count; index++
{
    var dist = Coordinate.distanceBetweenCoordinates(poiArray[0].coordinate, bCoordinate: poiArray[index].coordinate)
    if(dist <= 0.5)
    {
        nearBLS.append(poiArray[index]);
    }
}



