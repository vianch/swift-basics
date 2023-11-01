import Foundation

func noArgumentsNoReturns() {
     "NO ACTIONS"
}

noArgumentsNoReturns()
 
func plusTwoNoReturn(value: Int) {
    let newValue = value + 2
}

plusTwoNoReturn(value: 3)

func plusTwoReturnValue(value: Int) -> Int {
  value + 2 /// or return value + 2  the return word is optional if is the last code line
}


plusTwoReturnValue(value: 30)


func customMultipleValuesAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}

customMultipleValuesAdd(value1: 23, value2: 30)

func customMinusInternalLabel(
    _ leftHandSide: Int,  // external internal: Int
    _ rightHandSie: Int
) -> Int {
    leftHandSide - rightHandSie
}

let customSubstracted = customMinusInternalLabel(30, 40)

// function with return that can be consumed without asigment
@discardableResult
func myCustomAdd(_ leftHandSie: Int, _ rigthHandSide: Int) -> Int {
    leftHandSie + rigthHandSide
}

myCustomAdd(34, 22)

func doSomethingNested(with value: Int) -> Int {
    func mainLogic(valueInternal: Int) -> Int {
        valueInternal + 2
    }
    
    return mainLogic(valueInternal:  value + 3)
}

doSomethingNested( with: 30)

func getFullNameWithDefault (firstName: String = "Victor", lastName: String = "Chavarro") -> String {
    return "\(firstName) \(lastName)"
}

getFullNameWithDefault(lastName: "Perez")
getFullNameWithDefault(firstName: "Andres", lastName: "Perez")
