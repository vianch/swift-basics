import Foundation

let numberOne = 10
let numberTwo = 20
let result = numberOne + numberTwo
result

func perform<N: Numeric>(_ operation: (N, N) -> N, on leftHand: N, and rigthHand: N) -> N {
    operation(leftHand, rigthHand)
}

let value = perform(+, on: 10, and: 20.2)
// value now is a Double
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)
perform(/, on: 10, and: 20)


// Same but different
func performTwo<N>(_ operation: (N, N) -> N, on leftHand: N, and rigthHand: N) -> N where N: Numeric {
    operation(leftHand, rigthHand)
}

performTwo(+, on: 10, and: 20.2)
// value now is a Double
performTwo(-, on: 10, and: 20)
performTwo(*, on: 10, and: 20)
performTwo(/, on: 10, and: 20)

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanRun, CanJump {
    func jump() {
        "JUMPING"
    }
    
    func run() {
        "RUNNING..."
    }
}

func jumpAndRun<T: CanRun & CanJump>(_ value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)

let name: [String] = ["Victor", "Andres"]
//let name: Array<String> = ["Victor", "Andres"]


extension [String]  {
    func longestString() -> String? {
        self.sorted {
            (lhs: String, rhs: String) -> Bool in lhs.count > rhs.count
        }.first
    }
}
// lo mismo que:  extension Array where Element == String {}
["valueOne", "value Two", "three"].longestString()

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View) {
        // Empty for now
    }
}

struct Button: View {
    // View
}

protocol PresentableAsView {
     // generic protocol AssocietedType
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(superView: View, thisView: ViewType)
    func present(view: ViewType, on superView: View)
}

extension PresentableAsView {
    func configure(superView: View, thisView: ViewType) {
        // empty by defaul
    }
    
    func present(view: ViewType, on superView: View) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
    
    func configure(superView: View, thisView: Button) {
        // <#code#>
    }
    
    func present(view: Button, on superView: View) {
        // <#code#>
    }
}

extension PresentableAsView  where ViewType == Button {
    func executeButton() {
        "This is button"
    }
}

let button = MyButton()
button.executeButton()

extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1,2,3,4,5].average()
