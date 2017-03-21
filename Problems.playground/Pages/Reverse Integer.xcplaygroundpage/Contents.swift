//: hello

/*
 https://leetcode.com/problems/reverse-integer/#/description
 
 Reverse digits of an integer.

 Example1: x = 123, return 321
 Example2: x = -123, return -321

 Note:

 The input is assumed to be a 32-bit signed integer. Your function should return 0 when the reversed integer overflows.
*/
import Foundation


//: [Next](@next)
func reverse(_ x: Int) -> Int {
    guard x >= 0 else {
        return -reverse(abs(x))
    }
    let s = x.description
    let charsReversed : [Character] = Array(s.characters).reversed()
    let sreversed = charsReversed.map { $0.description }.joined(separator:"")
    return Int(sreversed)!

}

reverse(928374987234)
reverse(-23412341423423123)
