import Foundation

func multiplyByTwo(_ value: Int? = 0) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(8)

let age: Int? = nil
if age != nil {
    "AGE IS THERE"
} else {
    "AGE IS NIL"
}

if let age {
    "Age is there \(age)"
} else {
    "NO AGE PRESENT"
}

func checkAge() {
    guard age != nil else {
        "Age is nil as expected"
        return
    }
    
    "Age is not nil!!!"
}

switch age  {
case .none:
    "Age has no values"
    break
case let .some(value):
    "Age has the value: \(value)"
    break
}

if age == .some(0) {
    "Age is 0"
} else {
    "age is not 0"
}

struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstAdress: String?
    }
}

let myPerson: Person = Person(name: "Victor", address: nil)

if let firstAddressLine = myPerson.address?.firstAdress {
    firstAddressLine
} else {
    "DOESN'T HAVE A FIRST ADDRESS"
}

let bar: Person? = Person(name: "Barm", address: Person.Address(firstAdress: nil))


if bar?.name == "Barm", bar?.address?.firstAdress == nil {
    "has no first address"
}

switch bar?.address?.firstAdress {
    case let .some(firstAdress) where firstAdress.starts(with: "Ba"): "Has Ba on first line \(firstAdress)"
    case let .some(firstAdress): "Because didn't match de previous case"
case .none: "Ba first line is nil??"
}

func getFullName(firstName: String, lastName: String?) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

func getFullNameTwp(firstName: String, lastName: String?) -> String? {
    guard let lastName else {
        return nil
    }
    
    return "\(firstName) \(lastName)"
}
