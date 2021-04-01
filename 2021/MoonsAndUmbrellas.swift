// https://codingcompetitions.withgoogle.com/codejam/round/000000000043580a/00000000006d1145

// Samples: Passed
// Test Set 1: Passed
// Test Set 2: MLE (Memory Limit Exceeded)

import Foundation
func readLoop() -> Int {
    return readLine().flatMap { Int($0) }!
}
func readInput() -> (Int,Int,[String]) {
    let allString = Array(readLine().flatMap { $0.split(separator: " ") }!)
    let x = Int(allString[0])!
    let y = Int(allString[1])!
    let caseArray = allString[2].map { String($0)}
    return (x,y,caseArray)
}

var allCost: [Int] = []
var allDiffCase: [[String]] = []

func getDiffCase(oneCase: [String]){
    if let i = oneCase.firstIndex(of: "?"){
        var newCase1 = oneCase
        newCase1[i] = "C"
        var newCase2 = oneCase
        newCase2[i] = "J"
        getDiffCase(oneCase: newCase1)
        getDiffCase(oneCase: newCase2)
    } else {
        allDiffCase.append(oneCase)
    }
}

func getCost(x: Int, y: Int, oneCase: [String]) -> Int{
    if oneCase.count <= 1{
        return 0
    }
    var cost = 0
    for i in 0...oneCase.count-2{
        if oneCase[i]+oneCase[i+1] == "CJ"{
            cost += x
        } else if oneCase[i]+oneCase[i+1] == "JC"{
            cost += y
        }
    }
    return cost
}

let loop = readLoop()
for index in 1...loop {
    var nowCase = readInput()
    allCost = []
    allDiffCase = []
    getDiffCase(oneCase: nowCase.2)
    for oneDiffCase in allDiffCase{
        allCost.append(getCost(x: nowCase.0, y: nowCase.1, oneCase: oneDiffCase))
    }
    print("Case #\(index): \(allCost.min()!)")
}

// Samples: Passed
// Test Set 1: Passed
// Test Set 2: Passed
// Test Set 3: WA (Wrong Answer)

import Foundation
func readLoop() -> Int {
    return readLine().flatMap { Int($0) }!
}
func readInput() -> (Int,Int,[String]) {
    let allString = Array(readLine().flatMap { $0.split(separator: " ") }!)
    let x = Int(allString[0])!
    let y = Int(allString[1])!
    let caseArray = allString[2].map { String($0)}
    return (x,y,caseArray)
}

func getCost(_ x: Int, _ y: Int, _ oneCase: [String]) -> Int{
    var cost = 0
    var nowCase = oneCase
    for i in 0...nowCase.count - 1 - 1{
        let nowString = nowCase[i]+nowCase[i+1]
        if nowString == "CJ"{
            cost += x
        } else if nowString == "JC"{
            cost += y
        } else if nowString == "?C"{
            cost += 0
        } else if nowString == "?J"{
            cost += 0
        } else if nowString == "J?"{
            if i+2 <= (nowCase.count - 1){
                if nowCase[i+2] == "C"{ //J?C
                    nowCase[i+1] = "C"
                    cost += y
                } else if nowCase[i+2] == "?"{ //J??
                    nowCase[i+1] = "J"
                }
            }
        } else if nowString == "C?"{
            if i+2 <= (nowCase.count - 1){
                if nowCase[i+2] == "J"{ //C?J
                    nowCase[i+1] = "J"
                    cost += x
                } else if nowCase[i+2] == "?"{ //C??
                    nowCase[i+1] = "C"
                }
            }
        }
    }
    return cost
}

let loop = readLoop()
for index in 1...loop {

    var nowCase = readInput()
    let x = nowCase.0 //CJ 
    let y = nowCase.1 //JC
    var oneCase = nowCase.2
    var cost = 0
    if oneCase.count >= 2 {
        
        if oneCase[0] == "?"{
            var oneCaseC = oneCase
            oneCaseC[0] = "C"
            var oneCaseJ = oneCase
            oneCaseJ[0] = "J"
            cost = min(getCost(x, y, oneCaseC), getCost(x, y, oneCaseJ))
        } else {
            cost = getCost(x, y, oneCase)
        }
    }
    print("Case #\(index): \(cost)")
}