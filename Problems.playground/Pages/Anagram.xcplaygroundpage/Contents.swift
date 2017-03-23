//: [Previous](@previous)

/*
 Determine if two strings are anagrams of each other. The function can be case insensitive.
*/

import Foundation
import XCTest

func isAnagram(w1:String, w2:String) -> Bool {
    let s1 = Array(w1.lowercased().characters).sorted()
    let s2 = Array(w2.lowercased().characters).sorted()
    return s1 == s2
}

XCTAssert( isAnagram(w1: "TEAM", w2: "meta") )
XCTAssertFalse( isAnagram(w1: "TEAM", w2: "MEATT") )
XCTAssert( isAnagram(w1: "MTTEAM", w2: "EAMTTM") )
XCTAssertFalse( isAnagram(w1: "TEAM", w2: "") )

//: [Next](@next)
