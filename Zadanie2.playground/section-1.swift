///Zadanie 2 - BLS Patronage G: iOS
///Wojciech Tyziniec
///

enum MeasurementUnit
{
    case Kilometers
    case Miles
    case Centimeters
    case Inches
    case Feet
    case Yards
}

extension Float
{
    func convertMetersTo(unit: MeasurementUnit) -> Float
    {
        switch(unit)
        {
            case .Kilometers:
                return self * 0.001
                
            case .Miles:
                return self / 1609.344
            
            case .Centimeters:
                return self * 100
                
            case .Inches:
                return self / 0.0254
                
            case .Feet:
                return self * 3.28
            
            case .Yards:
                return self * 1.0936
        }
    }
}

let m: Float = 100.0
let km = m.convertMetersTo(MeasurementUnit.Kilometers)
let mile = m.convertMetersTo(MeasurementUnit.Miles)
let cm = m.convertMetersTo(MeasurementUnit.Centimeters)
let inch = m.convertMetersTo(MeasurementUnit.Inches)
let ft = m.convertMetersTo(MeasurementUnit.Feet)
let yd = m.convertMetersTo(MeasurementUnit.Yards)