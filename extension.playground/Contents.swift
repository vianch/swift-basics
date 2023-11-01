import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}

let two = 2
two.plusTwo()

/*
struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
       let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.firstName, lastName: components.lastName)
    }
}
*/

protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) foes vroom!!!"
    }
}


struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")


extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}
    
modelX.goVroom()


class MyDouble {
    var value: Double
    
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}
let myDouble = MyDouble()
myDouble.value

extension GoesVroom {
    func goVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more"
    }
}

modelX.goVroomEvenMore()
