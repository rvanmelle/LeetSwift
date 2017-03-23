//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 https://leetcode.com/problems/integer-to-roman/#/description
 
 Given an integer, convert it to a roman numeral.

 Input is guaranteed to be within the range from 1 to 3999.

 I = 1
 V = 5
 X = 10
 L = 50
 C = 100
 D = 500
 M = 1000
 */

extension Character {

    func times(_ cnt:Int) -> String {
        guard cnt >= 1 else { return "" }
        if self != "M" {
            guard cnt < 4 else { return "" }
        }
        return (1...cnt).reduce("") { (result, _) -> String in
            return result + description
        }
    }

}


func handlePair(_ p1:(Character, Int), _ p2:(Character,Int)) -> String {
    switch (p1,p2) {
    case let ((c1,cnt1),(c2,cnt2)) where cnt2 == 4:
        switch c1 {
        case "D": return cnt1 == 1 ? "CM" : "CD"
        case "L": return cnt1 == 1 ? "XC" : "XL"
        case "V": return cnt1 == 1 ? "IX" : "IV"
        default:
            return "FOO"
        }
    default:
        let (c1,cnt1) = p1
        return c1.times(cnt1)
    }
}

func intToRoman(_ num: Int) -> String {
    let ms = num / 1000
    let ds = (num % 1000) / 500
    let cs = (num % 500) / 100
    let ls = (num % 100) / 50
    let xs = (num % 50) / 10
    let vs = (num % 10) / 5
    let ones = (num % 5)
    let pair1 = (Character("D"),ds)
    let pair2 = (Character("C"),cs)
    let pair3 = (Character("L"),ls)
    let pair4 = (Character("X"),xs)
    let pair5 = (Character("V"),vs)
    let pair6 = (Character("I"),ones)
    return Character("M").times(ms)
        + handlePair(pair1, pair2)
        + handlePair(pair2, pair3)
        + handlePair(pair3, pair4)
        + handlePair(pair4, pair5)
        + handlePair(pair5, pair6)
        + Character("I").times(ones)
}

XCTAssert( intToRoman(3) == "III" )
XCTAssert( intToRoman(4) == "IV" )
XCTAssert( intToRoman(8) == "VIII" )
XCTAssert( intToRoman(9) == "IX" )
XCTAssert( intToRoman(4999) == "MMMMCMXCIX" )
XCTAssert( intToRoman(39) == "XXXIX" )

