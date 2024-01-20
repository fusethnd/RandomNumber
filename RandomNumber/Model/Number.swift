//
//  Number.swift
//  RandomNumber
//
//  Created by Thanadon Boontawee on 19/1/2567 BE.
//

import Foundation

struct Number {
    var val = 0.5
    
    static func random() -> Number {
        var num = Number()
        num.val = Double.random(in: 0...1)
        return num
    }
    
    func difference(target: Number) -> Double {
        let diff = val - target.val
        return sqrt(diff*diff)
    }
    
    func intString() -> String {
        "\(Int(val * 100.0))"
    }
}
