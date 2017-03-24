//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

/*
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 Empty cells are indicated by the character '.'.

 You may assume that there will be only one unique solution.
 
 https://leetcode.com/problems/valid-sudoku/#/description
*/

let v = UIView(frame:CGRect(x:0, y:0, width:200, height:200))
v.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = v
PlaygroundPage.current.needsIndefiniteExecution = true

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
}

func solveSudoku(_ board: inout Board) {
    
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
b.render()
solveSudoku(&b)


//: [Next](@next)
