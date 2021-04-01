// https://codingcompetitions.withgoogle.com/codejam/round/000000000043580a/00000000006d1145

// Samples: Passed
// Test Set 1: Passed

import Foundation

func readInputOne() -> Int {
    return readLine().flatMap { Int($0) }!
}
func readInputMuti() -> [Int] {
    return readLine().flatMap { $0.split(separator: " ").compactMap { Int($0)} }!
}

let loop = readInputOne()
var allCase: [[Int]] = []
for index in 1...loop {
    readLine()
    var nowCase = readInputMuti()
    var result = 0
    for i in 1...nowCase.count-1{
        var j = nowCase.firstIndex(of: i)! + 1
        result += (j-i+1)
        if j-1 > i-1 {
            var replace = Array(Array(nowCase[i-1...j-1]).reversed())
            for (replaceIndex, one) in replace.enumerated(){
              nowCase[i-1+replaceIndex] = one
            }
        }
    }
    print("Case #\(index): \(result)")
}