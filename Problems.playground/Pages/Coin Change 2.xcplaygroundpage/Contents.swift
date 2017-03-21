//: [Previous](@previous)

import Foundation

/*
 
 https://leetcode.com/problems/coin-change-2/#/description
 
 518. Coin Change 2
 
 You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.

 Note: You can assume that

 0 <= amount <= 5000
 1 <= coin <= 5000
 the number of coins is less than 500
 the answer is guaranteed to fit into signed 32-bit integer
 Example 1:

 Input: amount = 5, coins = [1, 2, 5]
 Output: 4
 Explanation: there are four ways to make up the amount:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 Example 2:

 Input: amount = 3, coins = [2]
 Output: 0
 Explanation: the amount of 3 cannot be made up just with coins of 2.
 Example 3:

 Input: amount = 10, coins = [10]
 Output: 1
 */

func descend(_ coins:[Int], _ idx:Int, _ amount:Int, _ total:Int) -> Int {
    let denomination = coins[idx]
    if total + denomination == amount {
        return 1
    }
    if total + denomination < amount {
        if idx + 1 < coins.count {
            return descend(coins, idx, amount, total + denomination)
                + descend(coins, idx+1, amount, total + coins[idx+1])
        } else {
            return descend(coins, idx, amount, total + denomination)
        }
    }
    return 0
}

func change(_ amount: Int, _ coins: [Int]) -> Int {
    var result = 0
    for i in 0...coins.count - 1 {
        result += descend(coins, i, amount, 0)
    }
    return result
}

change(3, [2])
change(10, [10])
change(10, [5,2,1])
change(10, [1,2])

//: [Next](@next)
