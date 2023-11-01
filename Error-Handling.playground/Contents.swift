import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    /*
    func getFullName() throws -> String {
        if let firstName, let lastName {
            "\(firstName) \(lastName)"
        } else if firstName == nil, lastName != nil {
            throw Errors.firstNameIsNil
        }
    }*/
    
    func getFullName2() throws -> String {
        switch(firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
            
        case (.some, .none):
            throw Errors.lastNameIsNil
            
        case (.none, .some):
            throw Errors.firstNameIsNil
            
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let myPerson = Person(firstName: "Victor", lastName: nil)
do {
    let fullName = try myPerson.getFullName2()
    fullName
} catch {
    "GOT AN ERROR = \(error)"
}

// Catch PErson  errors
do {
    let fullName2 = try myPerson.getFullName2()
    fullName2
} catch is Person.Errors {
    "GOT AN ERROR"
}

// Catch specifc errors
do {
    let fullName3 = try myPerson.getFullName2()
    fullName3
} catch Person.Errors.firstNameIsNil {
    "GOT AN ERROR FIRST NAME IS NIL"
}  catch Person.Errors.lastNameIsNil {
    "GOT AN ERROR LAST NAME IS NIL"
} catch {
    "OTHER ERRORS"
}

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
    myCar
} catch Car.Errors.invalidManufacturer {
    "INVALID MANUFACTURER"
} catch {
    "OTHER ERROR"
}


// try? optional the catch
if let youCar = try? Car(manufacturer: "Tesla") {
    "SUCCES IS A VALID CAR \(youCar)"
} else {
    "FAILED TO CONSTRUCT AND ERROR IS NOT ACCESSIBLE NOW"
}

// RARE WAY TO DO IT!!!
//try!
// Avoid if you want
//let theirCar = try! Car(manufacturer: "Ford")
//theirCar.manufacturer

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingError: Error {
        case cannotBarIsSleeping
    }
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingError.cannotBarIsSleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "RUN..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}


let poorDog =  Dog(isInjured: true, isSleeping: true)

do {
    try poorDog.barkAndRun()
} catch Dog.BarkingError.cannotBarIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
    "Is sleeping or injured"
} catch {
    "OTHER ERROR"
}

func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firsNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String? {
    guard let firstName, 
            !firstName.isEmpty else {
        throw NameErrors.firsNameIsInvalid
    }
    guard let lastName,
            !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let getFullName = try fullName(firstName: "VI", lastName: nil, calculator: +)
    getFullName
} catch NameErrors.firsNameIsInvalid {
    "First Name invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last Name invalid"
} catch {
    "OTHER ERROR"
}


enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before: \(thisValue)"
        }
    }
}

performGet(forValue: 5)
performGet(forValue: 0)
