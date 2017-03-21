//: [Previous](@previous)

/*
 Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

 https://leetcode.com/problems/valid-sudoku/#/description
 */

import Foundation

struct Board {

    let data: [[Character]]

    subscript(row: Int, column: Int) -> Character {
        return data[row][column]
    }

    func row(_ r:Int) -> [Character] { return data[r] }
    func col(_ c:Int) -> [Character] {
        return (0...rows-1).map { self[$0,c] }
    }
    func rowValues(_ r:Int) -> [Character] { return row(r).filter { $0 != "." }.sorted() }
    func colValues(_ r:Int) -> [Character] { return col(r).filter { $0 != "." }.sorted() }

    var rows: Int { return data.count }
    var cols: Int{ return data[0].count }

    var isValidPosition: Bool {
        for i in 0...rows-1 {
            let vals = rowValues(i)
            guard vals.count > 1 else { continue }
            for j in 1...vals.count-1 {
                if vals[j-1].asciiValue! >= vals[j].asciiValue! {
                    return false
                }
            }
            //print(board.row(i).sorted().map {$0.description}.joined() )
        }
        for i in 0...cols-1 {
            let vals = colValues(i)
            guard vals.count > 1 else { continue }
            for j in 1...vals.count-1 {
                if vals[j-1].asciiValue! >= vals[j].asciiValue! {
                    return false
                }
            }
            //print(board.col(i).sorted().map {$0.description}.joined() )
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

let b = Board(data:problem)
isValidSudoku(b)


b[3,4]
[1,2,3,4][1...3]

//: [Next](@next)
