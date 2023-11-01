import Foundation

var names = [
    "first"
]

names.append("Victor")
names.append("Andres")

let lastNames = [
    "chavarro"
]

// this is an structure can't be mutable lastNames.append("VICTOR")

// in the other hand this is a class with reference type and can be mutable
let oldArray = NSMutableArray(
    array: [
        "Hi",
        "Dog"
    ]
)

oldArray.add("!!!")

let someMoreNames = NSMutableArray(
    array: [
        "Mateo",
        "test"
    ]
)

func changeTheArray(_ array: NSArray) {
    let copy = array as! NSMutableArray
    copy.add("BAZ")
}

changeTheArray(someMoreNames)
someMoreNames

/// 1. Unary prefix
    let foo = !true
/// 2. Unary postfix
    let name = Optional("TEST")
type(of: name)
let unaryPostFix = name!
type(of: unaryPostFix)
/// 3. binary infix
"victor" + "andres"
