//: Playground - noun: a place where people can play

/*
 2. Add Two Numbers

 https://leetcode.com/problems/add-two-numbers/#/description

 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8

 */
import UIKit

import Foundation
import XCTest

extension ListNode {

    public var asInteger : Int? {
        return (description as NSString).integerValue
    }

    var reversed : ListNode {
        return description.asReversedIntegerList!
    }
}

extension String {
    var asReversedIntegerList: ListNode? {
        let chars : [Character] = Array(characters)
        let charsReversed = chars.reversed()
        let intsReversed = charsReversed.map { (ch) -> Int in
            return (ch.description as NSString).integerValue
        }
        return ListNode(intsReversed)
    }
}

func addTwoNumbers(_ l1: ListNode, _ l2: ListNode) -> ListNode? {
    let sum = l1.reversed.asInteger! + l2.reversed.asInteger!
    return sum.description.asReversedIntegerList
}

let x1 : ListNode = ListNode([2,4,3])!
let x2 : ListNode = ListNode([5,6,4])!
let result = addTwoNumbers(x1, x2)

if let result = result {
    XCTAssert(result.asInteger == 708)
} else {
    XCTAssert(false)
}
