//: Playground - noun: a place where people can play

/*
 https://leetcode.com/problems/add-two-numbers/#/description

 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8

 */
import UIKit

import Foundation
import XCTest

public class ListNode : CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public var description : String {
        if let n = self.next {
            return "\(self.val)\(n)"
        } else {
            return "\(self.val)"
        }
    }

    public var asInteger : Int? {
        return Int(description)
    }

    var reversed : ListNode {
        let chars : [Character] = Array(description.characters)
        let charsReversed = chars.reversed()
        let intsReversed = charsReversed.map { (ch) -> Int in
            return Int(ch)
        }
        return makeList(intsReversed)
    }
}

extension Int {
    /*var asList : ListNode {
     let theString = description
     for x in theString.characters {
     }
     }*/
}


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return nil
    }
}

func makeList(nums:[Int]) -> ListNode? {
    guard let first = nums.first else { return nil }
    let result = ListNode(first)
    var prev = result
    for other in nums[1...nums.count-1] {
        let next = ListNode(other)
        prev.next = next
        prev = next
    }
    return result
}

let x1 : ListNode = makeList(nums:[2,4,3])!
let x2 : ListNode = makeList(nums:[5,6,4])!

let r1 = x1.reversed
let r2 = x2.reversed
print(r1)
print(r2)
print(x1.asInteger!)
print(x2.asInteger!)
//print(r1)
if let result = Solution().addTwoNumbers(x1, x2) {
    print(result)
}
