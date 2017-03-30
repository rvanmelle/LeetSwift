//: [Previous](@previous)

/*
 36. Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

 https://leetcode.com/problems/valid-sudoku/#/description
 */

import Foundation
import XCTest

struct Board {

    var data: [[Character]]

    subscript(row: Int, column: Int) -> Character {
        get {
            return data[row][column]
        }
        set(newValue) {
            data[row][column] = newValue
        }
    }

    func row(_ r:Int) -> [Character] { return data[r] }
    func col(_ c:Int) -> [Character] {
        return (0...rows-1).map { self[$0,c] }
    }
    func rowValues(_ r:Int) -> [Character] { return row(r).filter { $0 != "." }.sorted() }
    func colValues(_ r:Int) -> [Character] { return col(r).filter { $0 != "." }.sorted() }

    func unitValues(_ row:Int, col:Int) -> [Character] {
        let row = 3*(row / 3)
        let col = 3*(col / 3)
        var vals : [Character] = []
        for i in row...(row+2) {
            for j in col...(col+2) {
                vals.append(self[i,j])
            }
        }
        return vals.filter { $0 != "." }.sorted()
    }


    var rows: Int { return data.count }
    var cols: Int{ return data[0].count }

    private func validSet(_ vals:[Character]) -> Bool {
        // Is the set of characters constitue a valid/legal set?
        guard vals.count > 1 else { return true }
        for j in 1...vals.count-1 {
            if vals[j-1].asciiValue! >= vals[j].asciiValue! {
                return false
            }
        }
        return true
    }

    var isValidPosition: Bool {
        for i in 0...rows-1 {
            if !validSet(rowValues(i)) { return false }
        }
        for i in 0...cols-1 {
            if !validSet(colValues(i)) { return false }
        }
        for i in [0,3,6] {
            for j in [0,3,6] {
                if !validSet(unitValues(i, col: j)) {
                    return false
                }
            }
        }
        return true
    }
}

func isValidSudoku(_ board: Board) -> Bool {
    return board.isValidPosition
}

let problem : [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],

    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],

    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"],
]

var b = Board(data:problem)
XCTAssert( isValidSudoku(b) )
b[0,0] = "6"
XCTAssert( !isValidSudoku(b) )
b[0,0] = "5"
b[3,3] = "2"
XCTAssert( !isValidSudoku(b) )



//: [Next](@next)
