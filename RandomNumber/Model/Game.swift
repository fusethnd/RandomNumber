//
//  Game.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var count = 0
    var correct = false
    var text = ""
    
    mutating func check(guess: Int) {
//  let difference = lround(guess.difference(target: target) * 100.0)
//  score = 100 - difference
        if guess == target {
            text = "Correct! \n You guess in \(count) round"
            correct = true
        } else if guess < target {
            text = "Greater"
            count += 1
        } else {
            text = "Less"
            count += 1
        }
    }
    
    mutating func startNewGame() {
        count = 0
        target = Int.random(in: 1...100)
    }
}
