import Foundation

// Protocols has no login in it, but is a contract to be implemented


protocol CanBreathe {
    func breathe() // functio ndecorations
}

// Structs can't inherit from other classes or structures but can from protocols
struct Animal: CanBreathe {
    func breathe() {
        "Animal Breathing..."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Human breathing..."
    }
}

let dog = Animal()
dog.breathe()

let human = Person()
human.breathe()
protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

// Automatically the jump function is being implemented from the extension CanJumo
struct Cat: CanJump {
    
}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    // let name: String is invalid in protocols
    var name: String { get }
    var age: Int { get set }
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    
    mutating func increaseAge() {
        self.age += 1
    }
}

struct  Dog: HasName {
    let name: String
    var age: Int
}

var myDog = Dog(name: "Mateo", age: 10)
myDog.name
myDog.age += 1
myDog.age
myDog.describeMe()
myDog.increaseAge()

protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int) -> Int
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) -> Int {
        self.speed += value
        
        return value
    }
}


struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var myBike = Bike()
myBike.speed
myBike.increaseSpeed(by: 10)
myBike.speed

func describe(obj: Any) -> String {
    if obj is Vehicle {
        "OBJ conform vehicle protocol"
    } else {
        "Objet does not conform vehicle protocol"
    }
}


describe(obj: myBike)
describe(obj: myDog)

// as?
func increaseSpeedOfVehicle(obj:  Any) {
    if var vehicle =  obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 30)
        vehicle.speed
    } else {
        "This is not a vehicle"
    }
}

increaseSpeedOfVehicle(obj: myBike)
increaseSpeedOfVehicle(obj: myDog)

// DON'T FORGET: !!!!! -> if myBike is instance of a struct the memory used in var vehicle =  obj as? Vehicle { is pointing to a different address but if is a class the memory is the same address
myBike.speed
