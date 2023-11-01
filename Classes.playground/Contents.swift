import Foundation

struct PersonStructured {
    var name: String
    var age: Int
}

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // Classes let internal mutability
    func increaseAge() {
        self.age += 1
    }
}

let myPerson = Person(name: "Vic", age: 21)
myPerson.increaseAge()
myPerson.age
// Change externally
myPerson.age += 10
myPerson.age

// Share the same position in memory
let mySecondPerson = myPerson
mySecondPerson.increaseAge()
myPerson.age

// In Swift, the === operator checks if two objects point to the same object in memory.
if myPerson === mySecondPerson {
    "Both person are poiting to the same memory section"
}

class Vehicle {
    func goVroom() {
        "VROOM VROOM"
    }
}

class Car: Vehicle {
    
}

let myCar = Car()

myCar.goVroom()
class PersonTwo {
    private(set) var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }

}

let myPersonTwoInstance = PersonTwo(age: 30)
myPersonTwoInstance.age
// myPersonTwoInstance.age += 1 // Cant be modified externally because isn't mutable

// Designared Initializers
class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X"
        self.year = 2022
    }
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    convenience init(model: String) {
        self.init(model: model, year: 2023)
    }
}

class TeslaModelY: Tesla {
    override init() {
       super.init(model: "Y", year: 2024)
        
        // CONVINIENCE INIT can't be inside subclases
        //super.init(model: "Y")
    }
}

let modelY = TeslaModelY()
modelY
modelY.model
modelY.manufacturer

let personTwo = PersonTwo(age: 20)
personTwo.age

func customIncreaseAge(with person: PersonTwo) {
    person.increaseAge()
}

customIncreaseAge(with: personTwo)
personTwo.age


class MyOtherClassWithDeInit {
    init() {
        "INITIALIZED"
    }
    
    func doSomething() {
        "Do somethinf"
    }
    
    deinit {
        "DEINIT"
    }
}

let myClosure = {
    let myOtherClass = MyOtherClassWithDeInit()
    myOtherClass.doSomething()
}

myClosure()
