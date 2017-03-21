//: [Previous](@previous)

import Foundation
/*
 Write a memoize function
 */

func memoize(_ fn: @escaping (() -> Int)) -> (() -> Int) {
    var val : Int?
    return { () -> Int in
        if let v = val {
            return v
        } else {
            let result = fn()
            val = result
            return result
        }
    }
}

func expensiveComputation() -> Int {
    return 10
}


let newFunction = memoize(expensiveComputation)
print(newFunction())


//: [Next](@next)
