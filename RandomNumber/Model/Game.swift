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
    
    private var from: Double
    private var to: Double
    
    init() {
        self.from = 0
        self.to = 100
    }
    
    mutating func setFrom(from: Double) {
        self.from = from
    }
    
    mutating func setTo(to: Double) {
        self.to = to
    }
    
    func getFrom() -> Double {
        self.from
    }
    
    func getTo() -> Double {
        self.to
    }
    
    func getDiff() -> Double {
        return (self.to - self.from)
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
        let guessVal = (lround(guess * self.getDiff()) + getFrom())
        let targetVal = lround(target * self.getDiff()) + getFrom()
        
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
        return lround((val * getDiff()) + getFrom())
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
