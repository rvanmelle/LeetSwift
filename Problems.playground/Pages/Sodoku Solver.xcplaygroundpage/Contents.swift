//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

/*
 https://leetcode.com/problems/sudoku-solver/#/description
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 Empty cells are indicated by the character '.'.

 You may assume that there will be only one unique solution.
 
 https://leetcode.com/problems/valid-sudoku/#/description
*/

/*let v = UIView(frame:CGRect(x:0, y:0, width:200, height:200))
v.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = v
PlaygroundPage.current.needsIndefiniteExecution = true
*/

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
        for i in [0,3,6] {
            for j in [0,3,6] {
                let vals = unitValues(i, col: j)
                guard vals.count > 1 else { continue }
                for j in 1...vals.count-1 {
                    if vals[j-1].asciiValue! >= vals[j].asciiValue! {
                        return false
                    }
                }
            }
        }
        return true
    }

    func render() {

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 36)!, NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName: UIColor.red]

            for j in 0...rows-1 {
                for i in 0...cols-1 {
                    let c = self[i,j].description
                    c.draw(with: CGRect(x: i*40+50, y: j*40+50, width: 40, height: 40), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
                }
            }
        }
        let iv = UIImageView(image: img)
        PlaygroundPage.current.liveView = iv
    }

    var nextOpenPosition: (Int,Int)? {
        for j in 0...rows-1 {
            for i in 0...cols-1 {
                if self[j,i] == "." {
                    return (j,i)
                }
            }
        }
        return nil
    }

    func validMoves(at row:Int, col:Int) -> [Character] {
        let allPossible : [Character] =  ["1","2","3","4","5","6","7","8","9"]
        let allUsed = rowValues(row) + colValues(col) + unitValues(row, col: col)
        let allValid = allPossible.filter { (c) -> Bool in
            return !allUsed.contains(c)
        }
        return allValid
    }
}

func solveSudoku(_ board: inout Board) -> Bool {
    // Basic depth-first back-tracking brute-force search
    guard let (row,col) = board.nextOpenPosition else {
        return board.isValidPosition
    }
    let isLastPosition = row == 8 && col == 8
    //print(row,col, isLastPosition, board.validMoves(at: row, col: col))
    for attemptedChar in board.validMoves(at: row, col: col) {
        board[row,col] = attemptedChar
        if board.isValidPosition && isLastPosition {
            return true
        }
        if board.isValidPosition {
            if solveSudoku(&board) {
                return true
            }
        }
    }
    board[row,col] = "."
    return false
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


let problem2 : [[Character]] = [
    [".","5",".","8",".","7",".","2","."],
    ["6",".",".",".","1",".",".","9","."],
    ["7",".","2","5","4",".",".",".","6"],
    [".","7",".",".","2",".","3",".","1"],
    ["5",".","4",".",".",".","9",".","8"],
    ["1",".","3",".","8",".",".","7","."],
    ["9",".",".",".","7","6","2",".","5"],
    [".","6",".",".","9",".",".",".","3"],
    [".","8",".","1",".","3",".","4","."],
]

var b = Board(data:problem2)
b.unitValues(3, col: 3)

//b.render()
solveSudoku(&b)
b.render()


//: [Next](@next)
