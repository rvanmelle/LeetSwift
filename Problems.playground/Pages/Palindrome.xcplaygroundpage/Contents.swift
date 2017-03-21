//: [Previous](@previous)

/*
 https://leetcode.com/problems/palindrome-number/#/description
 
 Determine whether an integer is a palindrome. Do this without extra space.
*/

import Foundation

extension Int {
    var reversed : Int {
        let asString = Array(description.characters).reversed().map { return $0.description }.joined(separator: "")
        return Int(asString)!
    }
}

func isPalindrome(_ x: Int) -> Bool {
    return x == x.reversed
}

isPalindrome(29342)
isPalindrome(5334335)


