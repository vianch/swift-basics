import Foundation
import PlaygroundSupport
import _Concurrency

PlaygroundPage.current.needsIndefiniteExecution = true

func calculateFullName(
    firstName: String,
    lastName: String

) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName)\(lastName)"
}
 
Task {
    let resultOne = await calculateFullName(firstName: "Vickr", lastName: "Bar")
    async let resultTwo = await calculateFullName(firstName: "Vickr2", lastName: "Bar2")
    await resultTwo
}

enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(2))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(2))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(2))
    return Clothe.trousers
}

struct Ensemble {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
}

func buyWhole() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let troucers = buyTrousers()
    let ensemble = Ensemble(
        clothes: await [
            try socks,
            try shirt,
            try troucers
        ],
        totalPrice: 200
    )
    
    return ensemble
}

Task {
    if let ensemble = try? await buyWhole() {
        print(ensemble)
    } else {
        "SOMETHING WRONG WITH THE TRANSACTION"
    }
}

func getFullName(
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String {
    "FULL VAR NAME"
}

Task {
    await getFullName(
        delay: .seconds(2)
    ) {
        async let name = fullName()
        return await name
    }
    
}
