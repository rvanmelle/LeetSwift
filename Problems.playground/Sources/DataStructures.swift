import Foundation

// Definition for singly-linked list.
public class ListNode : CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public var description : String {
        return "\(self.val) \(self.next)"
    }
}
