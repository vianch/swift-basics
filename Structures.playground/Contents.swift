import Foundation

/// One difference with classes you don't need to create Constructors s
struct Person {
    let name: String
    let age: Int
    
}

let myPerson = Person(
    name: "Victor",
    age: 20
)

myPerson.name
myPerson.age

// but an example create a constructor in order to prevent duplicated data
struct ComodoreComputer {
    let name: String
    let manufacturer: String
    
    init (name: String) {
        self.name = name
        self.manufacturer = "Comodore"
    }
}

// Same in a different way
struct ComodoreComputerDifferent {
    let name: String
    let manufacturer = "Comodore"
}

let c64 = ComodoreComputer(
    name: "MY comodore"
)

let c128 = ComodoreComputer(
    name: "MY comodore 128"
)

struct Humans {
    let firstName: String
    let lastName: String
    let fullName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
    }
}

struct HumansImprooved {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let myHuman = HumansImprooved(firstName: "Victor", lastName: "Chavarro")

myHuman.fullName

// Structures mutables
struct Car {
    var mySpeed: Int
    mutating func drive(speed: Int) {
        "Driving...."
        mySpeed = speed
    }
}

let inmutableCar = Car(mySpeed: 10)
// this can't execute because the LET inmutableCar.drive(speed: 20)

var mutableCar = Car(mySpeed: 10)
mutableCar.drive(speed: 30)
mutableCar.drive(speed: 40)

let copyCar = mutableCar

mutableCar.drive(speed: 50)
copyCar.mySpeed

struct LivingThing {
    init() {
        "I'm living thing"
    }
}

/* structs can't inherit from other structures
struct Animal: LivingThing {
    
}
 */

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer:  self.manufacturer, currentSpeed: currentSpeed)
    }
}

let myBike = Bike(manufacturer: "JP", currentSpeed: 20)

let yourBike = myBike.copy(currentSpeed: 30)
myBike.currentSpeed
yourBike.currentSpeed
