import Foundation

let firstName: String? = "victor"
let lastName: String? = "andres"
//let combined = firstName + lastName

func + (
    lhs: String?,
    rhs: String?
) -> String {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case let (.some(value), .none),
        let (.none, .some(value)):
        return value
    case let ( .some(value), .some(value) ):
        return lhs + rhs
    }
}


// Unary prefix
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}

let lowerCase = "lowerCase"
let upperCase = ^lowerCase

postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowerCase*
