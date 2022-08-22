//
//  ActionPoints+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension ActionPoints {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActionPoints> {
        return NSFetchRequest<ActionPoints>(entityName: "ActionPoints")
    }

    @NSManaged public var one: Int64
    @NSManaged public var two: Int64
    @NSManaged public var three: Int64
    @NSManaged public var four: Int64
    @NSManaged public var account: Account

    func initValues(one: Int = 0, two: Int = 0, three: Int = 0, four: Int = 0, account: Account) {
        self.one = Int64(one)
        self.two = Int64(two)
        self.three = Int64(three)
        self.four = Int64(four)
        self.account = account
    }
    
    var oneValue: Int {
        Int(one * 50)
    }
    var twoValue: Int {
        Int(two * 100)
    }
    var threeValue: Int {
        Int(three * 500)
    }
    var fourValue: Int {
        Int(four * 1000)
    }
    
    func getTotal() -> Int {
        oneValue + twoValue + threeValue + fourValue
    }
}

extension ActionPoints : Identifiable {

}
