//: [Previous](@previous)

/*
 
 https://leetcode.com/problems/license-key-formatting/#/description
 
 Now you are given a string S, which represents a software license key which we would like to format. The string S is composed of alphanumerical characters and dashes. The dashes split the alphanumerical characters within the string into groups. (i.e. if there are M dashes, the string is split into M+1 groups). The dashes in the given string are possibly misplaced.

 We want each group of characters to be of length K (except for possibly the first group, which could be shorter, but still must contain at least one character). To satisfy this requirement, we will reinsert dashes. Additionally, all the lower case letters in the string must be converted to upper case.

 So, you are given a non-empty string S, representing a license key to format, and an integer K. And you need to return the license key formatted according to the description above.
 
 Input: S = "2-4A0r7-4k", K = 4

 Output: "24A0-R74K"

 Explanation: The string S has been split into two parts, each part has 4 characters.
 
 Input: S = "2-4A0r7-4k", K = 3

 Output: "24-A0R-74K"

 Explanation: The string S has been split into three parts, each part has 3 characters except the first part as it could be shorter as said above.
 */

import Foundation
import XCTest

extension String {
    var rev : String {
        return String(characters.reversed())
    }

    var len : Int {
        return lengthOfBytes(using: String.Encoding.utf8)
    }
}


func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
    let S = S.rev
    let pieces = S.components(separatedBy: "-")
    let sreversed = pieces.joined()
    var newPieces : [String] = []

    let numSections = sreversed.len / K
    var cur = sreversed.startIndex
    for i in 0...numSections {
        if let next = sreversed.index(cur, offsetBy: K, limitedBy: sreversed.endIndex) {
            let piece = sreversed.substring(with: cur..<next)
            newPieces.append(piece)
            cur = next
        } else {
            let piece = sreversed.substring(with: cur..<sreversed.endIndex)
            if piece.len > 0 {
                newPieces.append(piece)
            }
        }
    }
    return newPieces.joined(separator: "-").rev
}

XCTAssert( licenseKeyFormatting("2-4A0r7-4k", 4) == "24A0-r74k" )
XCTAssert( licenseKeyFormatting("2-4A0r7-4k", 3) == "24-A0r-74k" )

//: [Next](@next)
