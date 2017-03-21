//: [Previous](@previous)

/*
 Determine if two strings are anagrams of each other. The function can be case insensitive.
*/

import Foundation

func isAnagram(w1:String, w2:String) -> Bool {
    let s1 = Array(w1.lowercased().characters).sorted()
    let s2 = Array(w2.lowercased().characters).sorted()
    return s1 == s2
}

let r1 = isAnagram(w1: "TEAM", w2: "meta")
let r2 = isAnagram(w1: "TEAM", w2: "MEATT")
let r3 = isAnagram(w1: "MTTEAM", w2: "EAMTTM")
let r4 = isAnagram(w1: "TEAM", w2: "")

//: [Next](@next)
