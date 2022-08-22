//
//  PickOneChest+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension PickOneChest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PickOneChest> {
        return NSFetchRequest<PickOneChest>(entityName: "PickOneChest")
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
    
    func convertOne(to type: RssType) -> Int {
        switch type {
        case .food:
            return Int(one * 10000)
        case .wood:
            return Int(one * 10000)
        case .stone:
            return Int(one * 7500)
        case .gold:
            return Int(one * 3000)
        case .gems:
            return 0
        }
    }
    
    func convertTwo(to type: RssType) -> Int {
        switch type {
        case .food:
            return Int(two * 50000)
        case .wood:
            return Int(two * 50000)
        case .stone:
            return Int(two * 37500)
        case .gold:
            return Int(two * 15000)
        case .gems:
            return 0
        }
    }
    
    func convertThree(to type: RssType) -> Int {
        switch type {
        case .food:
            return Int(three * 150000)
        case .wood:
            return Int(three * 150000)
        case .stone:
            return Int(three * 112500)
        case .gold:
            return Int(three * 50000)
        case .gems:
            return 0
        }
    }
    
    func convertFour(to type: RssType) -> Int {
        switch type {
        case .food:
            return Int(four * 500000)
        case .wood:
            return Int(four * 500000)
        case .stone:
            return Int(four * 375000)
        case .gold:
            return Int(four * 200000)
        case .gems:
            return 0
        }
    }
    
    func totalValue(of type: RssType) -> Int {
        convertOne(to: type) + convertTwo(to: type) + convertThree(to: type) + convertFour(to: type)
    }
}

extension PickOneChest : Identifiable {

}
