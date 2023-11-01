import Foundation

let numbers = [1,2,3,4,5]
numbers.first
numbers.last
numbers.count
numbers.map(-)

var mutatingNumers = [5,6,7]
mutatingNumers.append(8)
mutatingNumers.insert(3, at: 0)
mutatingNumers.insert(contentsOf: [1,2], at: 0)
for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value 
}

let values = numbers.map {
    (value: Int) -> String in String(value * 2)
}

values

numbers.filter { (value: Int) -> Bool in
    value >= 3
}

// compactMap is a combination between map and filter
numbers.compactMap {
    (value: Int) -> String? in value % 2 == 0 ? String(value) : nil
}

let numbersTwo: [Int?] = [1, 2, nil, 4, 5]
numbersTwo.count

let notNils = numbersTwo.filter {
    (value: Int?) -> Bool in
    value != nil
}

let numbersThree = [1,2,1,2]
numbersThree.count
numbersTwo.count

let stuffRandom = [1, "HELLO", 2, "WORLD"] as [Any]
stuffRandom.count

////////////// SETS //////////////
// A big difference between Sets and Arrays is the uniqueness of elements.
let uniqueNumbers = Set([1,2,3,4,5])
uniqueNumbers.count
uniqueNumbers.map(-)


let myNumbersSet = Set([1,2,3,nil,5])
myNumbersSet
let notNilNumbersSet = Set(
    myNumbersSet.compactMap {
        $0
    }
)
notNilNumbersSet

let stuffSet: Set<AnyHashable> = [1,2,3,"STRING TEXT COMBINED WITH NUMBERS"]
stuffSet
let integersInSuffSet = stuffSet.compactMap{
    (value: Any) -> Int? in value as? Int
}
integersInSuffSet

let stringsInSuffSet = stuffSet.compactMap{
    (value: Any) -> String? in value as? String
}
stringsInSuffSet

// Now the set is an array
type(of: integersInSuffSet)


// HASHABLE

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let randomId = UUID()

let myNewPerson = Person(
    id: randomId, // hashValue = 1
    name: "Victor", // hashValue = 2
    age: 38 // hashValue = 3
)

let personTwo = Person(
    id: randomId, // hashValue = 1
    name: "Andres", // hashValue = 4
    age: 20 // hashTable = 5
)
personTwo

let people: Set<Person> = [myNewPerson, personTwo]
people
people.count

struct UniquePerson: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) // Only will be hasheable the id
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

let uniqueId = UUID()

let myUniquePersonByIdOne = UniquePerson(
    id: uniqueId,
    name: "Viktor",
    age: 20
)

let myUniquePErsonByIdTwo = UniquePerson(
    id: uniqueId,
    name: "Vikram",
    age: 30
)

if myUniquePersonByIdOne == myUniquePErsonByIdTwo {
    "THEY AREN'T UNIQUE"
}
let uniquePeople: Set<UniquePerson> = Set([myUniquePersonByIdOne, myUniquePersonByIdOne])
uniquePeople
uniquePeople.count
uniquePeople.first!.name


////////////// DICTIONARIES //////////////
// Dictionaries are unordered collections of key-value associations.

let userInfo: [String: Any] = [
    "name": "Viktram",
    "age": 38,
    "address": ["line1": "address line1", "postCode": "123QS"]
]
userInfo
userInfo["name"]
(userInfo["address"] as! [String: String])["postCode"]
userInfo.keys
userInfo.values
for (key, value) in userInfo {
    print(key)
    print(value)
}

for (key, value) in userInfo where value is Int {
    value
}

for (key, value) in userInfo where value is Int && key.count > 0 {
    value
}
