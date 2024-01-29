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
    
    private var from: Int
    private var to: Int
    
    init() {
        self.from = 0
        self.to = 100
    }
    
    mutating func setFrom(from: Int) {
        self.from = from
    }
    
    mutating func setTo(to: Int) {
        self.to = to
    }
    
    func getFrom() -> Int {
        self.from
    }
    
    func getTo() -> Int {
        self.to
    }
    
    func getDiff() -> Double {
        return Double(self.to - self.from)
    }
    
//    mutating func check(guess: Int) -> Int {
//        self.count += 1
//        if (guess == the_number) { // win
//            return 0
//        } else if (guess < the_number) { // "The number is greater than your guess."
//            return -1
//        } else if (guess > the_number) { // "The number is less than your guess."
//            return 1
//        } else { // "Error, there is something wrong."
//            return 2
//        }
//    }
//
    mutating func check(guess: Double) {
        let guessVal = lround(guess * getDiff()) + getFrom()
        let targetVal = lround(target * getDiff()) + getFrom()
        
        if guessVal == targetVal {
            text = "Correct! \n You guess in \(count) round"
            correct = true
        } else if guessVal < targetVal {
            text = "The number is GREATER than your guess"
            count += 1
        } else {
            text = "The number is LESS than your guess"
            count += 1
        }
    }
    
    public func toint(val: Double) -> Int {
        return lround(val * getDiff()) + getFrom()
    }
    
//    mutating func startNewGame() {
//        count = 0
//        let start = self.getStart()
//        let stop = self.getStop()
//        the_number = Int.random(in: start...stop)
//    }
    
    mutating func startNewGame() {
        count = 0
        target = Double.random(in: 0...1)
    }
}
