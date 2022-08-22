//
//  Food+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var one: Int64
    @NSManaged public var two: Int64
    @NSManaged public var three: Int64
    @NSManaged public var four: Int64
    @NSManaged public var five: Int64
    @NSManaged public var seven: Int64
    @NSManaged public var six: Int64
    @NSManaged public var account: Account

    func initValues(
        one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0,
        seven: Int = 0, account: Account
    ) {
        self.one = Int64(one)
        self.two = Int64(two)
        self.three = Int64(three)
        self.four = Int64(four)
        self.five = Int64(five)
        self.six = Int64(six)
        self.seven = Int64(seven)
        self.account = account
    }
    
    var oneValue: Int {
        Int(one * 1000)
    }
    var twoValue: Int {
        Int(two * 10000)
    }
    var threeValue: Int {
        Int(three * 50000)
    }
    var fourValue: Int {
        Int(four * 150000)
    }
    var fiveValue: Int {
        Int(five * 500000)
    }
    var sixValue: Int {
        Int(six * 1500000)
    }
    var sevenValue: Int {
        Int(seven * 5000000)
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

extension Food : Identifiable {

}
