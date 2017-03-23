//: [Previous](@previous)

import Foundation

/*
 
 https://leetcode.com/problems/longest-absolute-file-path/#/description

Suppose we abstract our file system by a string in the following manner:

The string "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext" represents:

dir
subdir1
subdir2
file.ext
The directory dir contains an empty sub-directory subdir1 and a sub-directory subdir2 containing a file file.ext.

The string "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext" represents:

dir
subdir1
file1.ext
subsubdir1
subdir2
subsubdir2
file2.ext
The directory dir contains two sub-directories subdir1 and subdir2. subdir1 contains a file file1.ext and an empty second-level sub-directory subsubdir1. subdir2 contains a second-level sub-directory subsubdir2 containing a file file2.ext.

We are interested in finding the longest (number of characters) absolute path to a file within our file system. For example, in the second example above, the longest absolute path is "dir/subdir2/subsubdir2/file2.ext", and its length is 32 (not including the double quotes).

Given a string representing the file system in the above format, return the length of the longest absolute path to file in the abstracted file system. If there is no file in the system, return 0.

Note:
The name of a file contains at least a . and an extension.
The name of a directory or sub-directory will not contain a ..
Time complexity required: O(n) where n is the size of the input string.

Notice that a/aa/aaa/file1.txt is not the longest file path, if there is another path aaaaaaaaaaaaaaaaaaaaa/sth.png.
 */

func findSubPaths(_ root:String, paths:[String], otherRoots:[String]) -> [String] {

    var results : [String] = []
    var record = false
    for p in paths {
        if p == root {
            record = true
            continue
        }
        if otherRoots.contains(p) {
            record = false
            continue
        }
        if record {
            results.append(p)
        }
    }
    return results
}

func lengthLongestPath(_ input: String) -> Int {
    let paths = input.components(separatedBy: "\n")
    guard paths.count > 1 else {
        if let p = paths.first {
            i f p.contains(".") {
                return p.characters.count
            } else {
                return -1
            }
        } else {
            fatalError()
        }
    }
    let roots = paths.filter { (path) -> Bool in
        if path.characters.count < 1 {
            return false
        } else {
            let pos = path.index(path.startIndex, offsetBy: 1, limitedBy:path.endIndex)!
            return path.substring(to: pos) != "\t"
        }
    }

    var max = 0
    for root in roots {
        let others = roots.filter { $0 != root }
        let subPaths = findSubPaths(root, paths: paths, otherRoots: others)

        let correctedSubPaths = subPaths.filter { $0.characters.count > 0}.map { (p) -> String in
            let pos = p.index(p.startIndex, offsetBy: 1)
            return p.substring(from: pos) + "\n"
        }

        let len = root.characters.count + lengthLongestPath(correctedSubPaths.joined()) + 1
        if len > max {
            max = len
        }
    }
    return max
}


lengthLongestPath("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext") == "dir/subdir2/subsubdir2/file2.ext"
lengthLongestPath("dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext")

//: [Next](@next)
