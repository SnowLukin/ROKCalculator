//
//  Materials+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension Materials {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Materials> {
        return NSFetchRequest<Materials>(entityName: "Materials")
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

extension Materials : Identifiable {

}
