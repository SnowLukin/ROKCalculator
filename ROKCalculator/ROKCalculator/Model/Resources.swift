//
//  Resources.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import Foundation


struct Food {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    
    init(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
    }
    
    var oneValue: Int {
        one * 1000
    }
    var twoValue: Int {
        two * 10000
    }
    var threeValue: Int {
        three * 50000
    }
    var fourValue: Int {
        four * 150000
    }
    var fiveValue: Int {
        five * 500000
    }
    var sixValue: Int {
        six * 1500000
    }
    var sevenValue: Int {
        seven * 5000000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

struct Wood {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    
    init(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
    }
    
    var oneValue: Int {
        one * 1000
    }
    var twoValue: Int {
        two * 10000
    }
    var threeValue: Int {
        three * 50000
    }
    var fourValue: Int {
        four * 150000
    }
    var fiveValue: Int {
        five * 500000
    }
    var sixValue: Int {
        six * 1500000
    }
    var sevenValue: Int {
        seven * 5000000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

struct Stone {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    
    init(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
    }
    
    var oneValue: Int {
        one * 750
    }
    var twoValue: Int {
        two * 7500
    }
    var threeValue: Int {
        three * 37500
    }
    var fourValue: Int {
        four * 112500
    }
    var fiveValue: Int {
        five * 375000
    }
    var sixValue: Int {
        six * 1125000
    }
    var sevenValue: Int {
        seven * 3750000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

struct Gold {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    
    init(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
    }
    
    var oneValue: Int {
        one * 500
    }
    var twoValue: Int {
        two * 3000
    }
    var threeValue: Int {
        three * 15000
    }
    var fourValue: Int {
        four * 50000
    }
    var fiveValue: Int {
        five * 200000
    }
    var sixValue: Int {
        six * 600000
    }
    var sevenValue: Int {
        seven * 2000000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

struct Gems {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    var eight: Int
    var nine: Int
    
    init(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0, eight: Int = 0, nine: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
        self.eight = eight
        self.nine = nine
    }
    
    var oneValue: Int {
        one * 5
    }
    var twoValue: Int {
        two * 10
    }
    var threeValue: Int {
        three * 50
    }
    var fourValue: Int {
        four * 100
    }
    var fiveValue: Int {
        five * 200
    }
    var sixValue: Int {
        six * 500
    }
    var sevenValue: Int {
        seven * 650
    }
    var eightValue: Int {
        eight * 1000
    }
    var nineValue: Int {
        nine * 2000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue + eightValue + nineValue
    }
}

struct ActionPoints {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    
    init(one: Int = 0, two: Int = 0, three: Int = 0, four: Int = 0) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
    }
    
    var oneValue: Int {
        one * 50
    }
    var twoValue: Int {
        two * 100
    }
    var threeValue: Int {
        three * 500
    }
    var fourValue: Int {
        four * 1000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue
    }
}

struct Vip {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    var five: Int
    var six: Int
    var seven: Int
    var eight: Int
    
    init(one: Int = 0, two: Int = 0, three: Int = 0,
         four: Int = 0, five: Int = 0, six: Int = 0,
         seven: Int = 0, eight: Int = 0
    ) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
        self.five = five
        self.six = six
        self.seven = seven
        self.eight = eight
    }
    
    var oneValue: Int {
        one * 5
    }
    var twoValue: Int {
        two * 10
    }
    var threeValue: Int {
        three * 50
    }
    var fourValue: Int {
        four * 100
    }
    var fiveValue: Int {
        five * 200
    }
    var sixValue: Int {
        six * 500
    }
    var sevenValue: Int {
        seven * 1000
    }
    var eightValue: Int {
        eight * 5000
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue + eightValue
    }
}

struct Materials {
    enum MaterialType {
        case normal
        case advanced
        case epic
        case legendary
    }
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    
    init(one: Int = 0, two: Int = 0, three: Int = 0, four: Int = 0) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
    }
    
    func convertToNormal(value: Int, of type: MaterialType) -> Int {
        switch type {
        case .normal:
            return value
        case .advanced:
            return value * 4
        case .epic:
            return value * 4 * 4
        case .legendary:
            return value * 4 * 4 * 4
        }
    }
}

struct PickOneChest {
    var one: Int
    var two: Int
    var three: Int
    var four: Int
    
    init(one: Int = 0, two: Int = 0, three: Int = 0, four: Int = 0) {
        self.one = one
        self.two = two
        self.three = three
        self.four = four
    }
    
    func convertOne(value: Int, to type: RssType) -> Int {
        switch type {
        case .food:
            return value * 10000
        case .wood:
            return value * 10000
        case .stone:
            return value * 7500
        case .gold:
            return value * 3000
        }
    }
    
    func convertTwo(value: Int, to type: RssType) -> Int {
        switch type {
        case .food:
            return value * 50000
        case .wood:
            return value * 50000
        case .stone:
            return value * 37500
        case .gold:
            return value * 15000
        }
    }
    
    func convertThree(value: Int, to type: RssType) -> Int {
        switch type {
        case .food:
            return value * 150000
        case .wood:
            return value * 150000
        case .stone:
            return value * 112500
        case .gold:
            return value * 50000
        }
    }
    
    func convertFour(value: Int, to type: RssType) -> Int {
        switch type {
        case .food:
            return value * 500000
        case .wood:
            return value * 500000
        case .stone:
            return value * 375000
        case .gold:
            return value * 200000
        }
    }
}
