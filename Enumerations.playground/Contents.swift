import Foundation

struct AnimalsCategories {
    let type: String
    
    init(type: String) {
        if type == "Rabbit" || type == "Cat" {
            self.type = type
        } else {
            self.type = "Other type"
        }
    }
}

AnimalsCategories(type: "Dog")

// Categorization of similar values

enum AnimalsVariations {
    case cat
    case dog
    case rabbit
}

enum Animals {
    case cat, dog, rabbit
}

let category = Animals.cat

if category == Animals.cat {
    "This is cat"
} else {
    "Other Animal"
}

switch category {
case .cat:
    "This is a CAT"
    break
case .dog:
    "This is a DOG"
    break
default:
    "This is something else"
}

func describeAnimal(_ animal: Animals) {
    switch animal {
        case .cat:
            "This is a CAT"
            break
        case .dog:
            "This is a DOG"
            break
        default:
            "This is something else"
    }
}

describeAnimal(category)

enum Shortcut {
    case fileOrFoldeer(path: URL, name: String)
    case url
    case urlPath(path: URL)
    case song(artist: String, songName: String)
}

let appleUrl = Shortcut.url // this is not the apple url
let trueAppleUrl = Shortcut.urlPath(path: URL(string: "https://apple.com")!)

// THIS CANT BE COMPARED: if trueAppleUrl == Shortcut.urlPath(path: URLURL(string: "https://apple.com")!){}
 
switch appleUrl {
    case .fileOrFoldeer(path: let path, name: let name):
        path
        name
        break
    case .url:
        break
    case .urlPath(path: let path):
        path
        break
    case .song(artist: let artist, songName: let songName):
        artist
        songName
        break
}

switch appleUrl {
    case .fileOrFoldeer( let path,  let name):
        path
        name
        break
    case .url:
        break
    case .urlPath( let path):
        path
        break
    case .song( let artist, let songName):
        artist
        songName
        break
}

switch appleUrl {
    case let .fileOrFoldeer(  path,   name):
        path
        name
        break
    case .url:
        break
    case let .urlPath(path):
        path
        break
    case let .song( artist, songName):
        artist
        songName
        break
}

if case let .urlPath(path) = appleUrl {
    path
}

let withOutYou = Shortcut.song(artist: "SX", songName: "Without you")

if case let .song(_, songName) = withOutYou {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
}

let carOne = Vehicle.car(manufacturer: "Tesla", model: "X")
let bikeOne = Vehicle.bike(manufacturer: "HD", yearMade: 1985)

switch carOne {
case let .car(manufacturer, _):
    manufacturer
    break
case let .bike(manufacturer, _):
    manufacturer
    break
}


switch bikeOne {
case let .car(manufacturer, _):
    manufacturer
    break
case let .bike(manufacturer, _):
    manufacturer
    break
}

func getManufacturer(from vehicle: Vehicle) -> String {
    switch vehicle {
    case let .car(manufacturer, _):
        return manufacturer
    case let .bike(manufacturer, _):
        return manufacturer
    }
}

getManufacturer(from:  carOne);
getManufacturer(from:  bikeOne);

enum VehicleUpdated {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    func getManufacturer() -> String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
}
    let carTwo = VehicleUpdated.car(manufacturer: "Tesla2", model: "T")
    let bikeTwo = VehicleUpdated.bike(manufacturer: "HD2", yearMade: 1995)
    
carTwo.getManufacturer();
bikeTwo.getManufacturer();

enum VehicleUpdatedAndEnhanced {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer:  String {
        switch self {
        case let .car(manufacturer, _),
                let .bike(manufacturer, _):
                    return manufacturer
        }
    }
}

let carThree = VehicleUpdatedAndEnhanced.car(manufacturer: "Tesla3", model: "T2")
let bikeThree = VehicleUpdatedAndEnhanced.bike(manufacturer: "HD3", yearMade: 2005)

carThree.manufacturer;
bikeThree.manufacturer;

enum Familymember: String  {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

Familymember.father
Familymember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "☺️"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)
FavoriteEmoji.blush
FavoriteEmoji.blush.rawValue

// reversed
if let blush = FavoriteEmoji(rawValue: "☺️") {
    "found emogi"
    blush
} else {
    "Emoji does not exist"
}

if let snowExist = FavoriteEmoji(rawValue:  "❄️") {
    "found emogi"
    snowExist
} else {
    "Emoji does not exist"
}

enum Heigh {
    case short, medium, long
    
    mutating func makeLong() {
        self = Heigh.long
    }
}

var myHeigh = Heigh.medium
myHeigh.makeLong()
myHeigh

indirect enum IntOperation {
    case add(Int, Int)
    case substract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(of operation: IntOperation? = nil)  -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
                return lhs + rhs
        case let .substract(lhs, rhs):
                return lhs - rhs
        case let . freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2,4))
freeHand.calculateResult()
