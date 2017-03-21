//: [Previous](@previous)

import Foundation

/*
 Write a function which generates all of the unique permutations of a string.
 
 What is the time complexity of your solution? How could it be improved?
 */

func permutations(_ x:String) -> [String] {
    let allCharacters : [Character] = Array(x.characters)
    guard allCharacters.count > 1 else {
        return [x]
    }
    var result : [String] = []
    for idx in 0...allCharacters.count-1 {
        let c = allCharacters[idx]
        var subSet = allCharacters
        subSet.remove(at: idx)
        let subPermutations : [String] = permutations(subSet.map { return String($0) }.joined())
        let subResult : [String] = subPermutations.map {
            return String(c) + $0
        }
        result += subResult
    }
    return result
}

let s = "baba"
let allResults = permutations(s)
print(allResults)

var uniqueResults : [String:Int] = [:]
for p in allResults {
    if let v = uniqueResults[p] {
        uniqueResults[p] = v + 1
    } else {
        uniqueResults[p] = 1
    }
}

print(Array(uniqueResults.keys))


//: [Next](@next)
