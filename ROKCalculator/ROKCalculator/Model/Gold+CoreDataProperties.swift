//
//  Gold+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension Gold {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gold> {
        return NSFetchRequest<Gold>(entityName: "Gold")
    }

    @NSManaged public var one: Int64
    @NSManaged public var two: Int64
    @NSManaged public var three: Int64
    @NSManaged public var four: Int64
    @NSManaged public var five: Int64
    @NSManaged public var six: Int64
    @NSManaged public var seven: Int64
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
        Int(one * 500)
    }
    var twoValue: Int {
        Int(two * 3000)
    }
    var threeValue: Int {
        Int(three * 15000)
    }
    var fourValue: Int {
        Int(four * 50000)
    }
    var fiveValue: Int {
        Int(five * 200000)
    }
    var sixValue: Int {
        Int(six * 600000)
    }
    var sevenValue: Int {
        Int(seven * 2000000)
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue + fiveValue + sixValue + sevenValue
    }
}

extension Gold : Identifiable {

}
