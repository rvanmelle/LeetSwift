import Foundation

// Definition for singly-linked list.
public class ListNode : CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init?(_ nums:[Int]) {
        guard let first = nums.first else { return nil }
        self.val = first
        var prev = self
        for other in nums[1...nums.count-1] {
            let next = ListNode(other)
            prev.next = next
            prev = next
        }
    }

    public var description : String {
        if let n = self.next {
            return "\(self.val)\(n)"
        } else {
            return "\(self.val)"
        }
        //return "\(self.val) \(self.next)"
    }

    public var array: [Int] {
        var result: [Int] = []
        result.append(val)
        if let n = next {
            result += n.array
        }
        return result
    }
}
