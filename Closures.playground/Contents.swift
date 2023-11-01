import Foundation
//
// func add(
//    _ leftHand: Int,
//    _ rightHand: Int,
// ) -> Int {
//     
// }

let add: (Int, Int) -> Int = {
    (leftHand: Int, rightHand: Int) -> Int in
    leftHand + rightHand
}

add(20 , 30)

func customAdd(
    _ leftHand: Int,
    _ rigthHand: Int,
    using internalFunction: (Int, Int) -> Int
) -> Int  {
    internalFunction(leftHand, rigthHand)
}

customAdd(22, 30, using: { (leftHand: Int, rigthHand: Int) -> Int in
        leftHand + rigthHand
    }
)

/// trailing clousure sintax
/// It's better give the types, the compiler take more time if need to infer the types
customAdd(12, 30) {
    (lhs: Int, rhs: Int) -> Int in lhs + rhs
}

customAdd(122, 30) {
    (lhs, rhs) in lhs + rhs
}

customAdd(123,130) {
     $0 + $1
}

let ages = [30, 20, 10, 40]

ages.sorted(by: { (lhs: Int, rhs: Int) -> Bool in lhs < rhs } )
ages.sorted(by: { $0  <  $1 } )

ages.sorted(by:  < )
ages.sorted(by:  > )


func customAdd2(
    _ leftHand: Int,
    _ rigthHand: Int,
    using internalFunction: (Int, Int) -> Int
) -> Int  {
    internalFunction(leftHand, rigthHand)
}

func addTenTwo (_ value: Int) -> Int {
   return value + 10
}

func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

doAddition(on: 20) {
    (value) in value + 30
}

doAddition(
    on: 110,
    using:  addTenTwo(_: )
)


