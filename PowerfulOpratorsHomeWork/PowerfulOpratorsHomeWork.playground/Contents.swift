import UIKit

// ----------task 1----------
func averageFuel(liter: Double, distanceTraveled: Double) -> Double {
    var avarageFuelPer100km = liter * 100 / distanceTraveled
    
    return avarageFuelPer100km
    
}

print("Average compsumtion per 100 km is \(averageFuel(liter: 50.0, distanceTraveled: 200.0)) liters per 100 km")

struct datesOfFueling {
    var date: String
    var distance: Double
    var amountOfFuel: Double
}

var fuelingsData = [datesOfFueling]()

// ----------task 2----------
func fuelConsumptionBetweenCurrentAndLastFueling(date: String, distance: Double, amountOfFuel: Double) {
    
    let currentFueling = datesOfFueling(date: date, distance: distance, amountOfFuel: amountOfFuel)
    
    let previousData = fuelingsData.last ?? currentFueling
    
    fuelingsData.append(currentFueling)
    
    let average = (averageFuel(liter: currentFueling.amountOfFuel, distanceTraveled: currentFueling.distance) + averageFuel(liter: previousData.amountOfFuel, distanceTraveled: previousData.distance)) / 2.0
    
    print("Average between first and last date (\(date)) is \(average) L/ 100KM")
    
}

fuelConsumptionBetweenCurrentAndLastFueling(date: "11/07/2022", distance: 108.0, amountOfFuel: 8.0)
fuelConsumptionBetweenCurrentAndLastFueling(date: "11/07/2022", distance: 100.0, amountOfFuel: 7.0)
fuelConsumptionBetweenCurrentAndLastFueling(date: "13/07/2022", distance: 78.0, amountOfFuel: 5.0)

// ----------task 3----------
func lPer100KmToMpg (litersPer100Km: Double) -> Double {
    let mpg = litersPer100Km * 2.3522
    return mpg
}

print("\(lPer100KmToMpg(litersPer100Km: 10.0)) Miles per galon")

// ----------task 4----------
func calculationAvergePricePerKilometer(pricePerLiter: Double) {
    var average = 0.0
    
    for data in fuelingsData {
        average += averageFuel(liter: data.amountOfFuel , distanceTraveled: data.distance)
    }
    let averageNum = average / Double(fuelingsData.count)
    
    let pricePerKelometer = (pricePerLiter * averageNum) / 100
    
    print(String(format: "Average price per kelometer is %.2F lv", pricePerKelometer))
}

calculationAvergePricePerKilometer(pricePerLiter: 5.50)

// ----------task 5----------
func informationAboutConpsumptionAndDateOfFueling(date: String, price: Double) {
    
   var restul = [datesOfFueling]()
    
    for data in fuelingsData {
        if data.date == date {
            restul.append(data)
        }
    }
    
    if restul.isEmpty {
        print("No data")
    }
    else {
        var consumptionLiters = 0.0
        for item in restul {
            consumptionLiters += item.amountOfFuel
        }
        print(String(format: "Consumption for \(date) is %.2F", consumptionLiters * price))
    }
}

informationAboutConpsumptionAndDateOfFueling(date: "11/07/2022", price: 5.55)
