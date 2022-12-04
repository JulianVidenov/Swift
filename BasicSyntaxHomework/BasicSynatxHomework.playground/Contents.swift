//Homework by Yulian Videnov

import UIKit

// FIRST TASK

// triangle info


// getting the surface of a triangle
func getSurfaceOfATriangle(
sideA: Float,
height: Float) -> Float{
    let result: Float = (sideA * height)/2
    return result
}

// printing the surface of the triangle
print("Surface of the triangle is: \(getSurfaceOfATriangle(sideA: 2.345, height: 5.432))")



// SECOND TASK

// getting the surface of the circle
func getSurfaceOfACircle(radius: Float) -> Float{
    let surfaceOfACircle = pow(radius, 2) * Float.pi
    return surfaceOfACircle
}

// getting the perimeter of the circle
func getPerimeterOfACircle(radius: Float) -> Float{
    let perimeterOfACircle = pow(Float.pi, 2) * radius
    return perimeterOfACircle
}

//Printing the surface and the perimeter of the circle
print("Surface of a circle is: \(getSurfaceOfACircle(radius: 3.526))")
print("Perimeter of a circle is: \(getPerimeterOfACircle(radius: 3.526))")

// THIRD TASK

// structure info for the car
struct Car{
    let make: String
    let model: String
    let horsePower: Double
    let Torque: Float
    let dateOfManifacture: String
}

//getting the car info
func getInfoForTheCar (Car: Car) -> String{
    let infoForTheCar: String = "\(Car.make),\(Car.model),\(Car.horsePower),\(Car.Torque),\(Car.dateOfManifacture)"
    return infoForTheCar
}

// givving the car info
let getCarInfo = getInfoForTheCar(Car: Car(make: "Mercedes",model: "S500",horsePower:429.52,Torque:383.432,dateOfManifacture: "11/07/2020"))

// printing the car info
print("Car info: \(getCarInfo)")

// getting the hp and turning it to Watts
func getHorsePowerAndTurnToWatts(Car: Car) -> Double{
    let convertHpToWatts = Car.horsePower * 746
    return convertHpToWatts
}

// getting the info for the car hp
let convertToWatts = getHorsePowerAndTurnToWatts(Car: Car(make: "Mercedes",model: "S500",horsePower:429.52,Torque:383.432,dateOfManifacture: "11/07/2020"))

// printing the hp in watts
print("Horse power of the car in watts is: \(convertToWatts) (W)")
