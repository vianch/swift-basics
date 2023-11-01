import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

let myPersonOne = Person(
    id: "1",
    name: "Victor"
)

let myPersonTwo = Person(
    id: "1", name: "Andrew"
)
    
if myPersonOne == myPersonTwo {
    "They are equal"
} else {
    "They are nooooot equal!!!"
}

/* Workaround
extension Person {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
} */
// enum AnimalType: Equatable
enum Animaltype {
    case dog(breed: String)
    case cat(breed: String)
}

let dogOne = Animaltype.dog(breed: "Labrador")
let dogTwo = Animaltype.dog(breed: "Labrador")

if dogOne == dogTwo {
    "Dogs are equal"
} else {
    "Dogs are not equal"
}

extension Animaltype: Equatable {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        switch(lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)),
             let (.cat(lhsBreed), .cat(rhsBreed)):
            return lhsBreed == rhsBreed
        default:
            return false
        }
    }
}

// if we use Equatable inside another struct. enum, etc we need to make them equatale as well
struct Animal: Equatable {
    let name: String
    let type: Animaltype
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let catOne = Animal(
    name: "macarron",
    type: .cat(breed: "Street cat")
)
let catTwo = Animal(
    name: "whoosh",
    type: .cat(breed: "Street cat")
)

if catOne == catTwo {
    "they are equal because of their type"
} else {
    "not same cats"
}





///////////// HASHABLE /////////
///////////// HASHABLE /////////
struct House: Hashable {
        let number: Int
        let numberOfBedriins: Int
}

let houseOne = House(number: 123, numberOfBedriins: 4)
houseOne.hashValue
let houseTwo = House(number: 123, numberOfBedriins: 3)
houseTwo.hashValue

let houses = Set([houseOne, houseTwo])
houses.count

struct HouseUnique: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let houseThree = HouseUnique(number: 123, numberOfBedrooms: 3)
let houseFour = HouseUnique(number: 123, numberOfBedrooms: 4)
let houseCombinedTwo = Set([houseThree, houseFour])
houseCombinedTwo.count
houseCombinedTwo.first!.numberOfBedrooms
houseThree.hashValue
houseFour.hashValue



enum CartParts {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CartParts> = [
    .roof,
    .tire,
    .roof,
    .trunk
]

enum HouseType: Hashable {
    case bigHouse(HouseUnique)
    case smallHouse(HouseUnique)
}

let bigHouseOne = HouseType.bigHouse(HouseUnique(
    number: 1, numberOfBedrooms: 4
))

let bigHouseTwo = HouseType.bigHouse(HouseUnique(
    number: 1, numberOfBedrooms: 5
))

let smallHouseOne = HouseType.smallHouse(HouseUnique(
    number: 1, numberOfBedrooms: 1
))

let allHouses: Set<HouseType> = [
 bigHouseOne, bigHouseTwo, smallHouseOne
]

allHouses.count
for value in allHouses {
    print(value)
}
