//: [Previous](@previous)

/**
 32. Longest Valid Parentheses
 
 https://leetcode.com/problems/longest-valid-parentheses/#/description
 
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 For "(()", the longest valid parentheses substring is "()", which has length = 2.

 Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.

 */

import Foundation
import XCTest


func longestValidParentheses(_ s: String) -> Int {
    return 3
}

XCTAssert(longestValidParentheses("(()") == 2)
XCTAssert(longestValidParentheses(")()())") == 4)

//: [Next](@next)
