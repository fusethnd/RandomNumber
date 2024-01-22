//
//  Game.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import Foundation

struct Game {
    var target = Double.random(in: 0...1)
    var count = 0
    var correct = false
    var text = ""
    
    mutating func check(guess: Double) {
        let guessVal = lround(guess*100)
        let targetVal = lround(target*100)
        if guessVal == targetVal {
            text = "Correct! \n You guess in \(count) round"
            correct = true
        } else if guessVal < targetVal {
            text = "Greater"
            count += 1
        } else {
            text = "Less"
            count += 1
        }
    }
    
    static func toint(val: Double) -> Int{
            return lround(val * 100)
    }
    
    mutating func startNewGame() {
        count = 0
        target = Double.random(in: 0...1)
    }
}
