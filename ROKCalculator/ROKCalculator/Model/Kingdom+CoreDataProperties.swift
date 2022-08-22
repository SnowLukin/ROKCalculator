//
//  Kingdom+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension Kingdom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kingdom> {
        return NSFetchRequest<Kingdom>(entityName: "Kingdom")
    }

    @NSManaged public var name: Int16
    @NSManaged public var accounts: NSSet?

    public var wrappedAccounts: [Account] {
        if let accounts = accounts {
            let accountsArray = accounts as? Set<Account> ?? []
            
            return accountsArray.sorted(by: {
                $0.name < $1.name
            })
        }
        return []
    }
    
    func initValues(name: Int, accounts: [Account] = []) {
        self.name = Int16(name)
        self.accounts = NSSet(array: accounts)
    }
    
    func totalChestValue(of type: RssType) -> String {
        getRssValue(wrappedAccounts.map { $0.pickChests.totalValue(of: type) }.reduce(0, +))
    }
    
    func totalResources(of type: RssType) -> String {
        switch type {
        case .food:
            return getRssValue(
                wrappedAccounts.map { $0.food.getTotal() + Int($0.currentFood) }.reduce(0, +)
            )
        case .wood:
            return getRssValue(
                wrappedAccounts.map { $0.wood.getTotal() + Int($0.currentWood) }.reduce(0, +)
            )
        case .stone:
            return getRssValue(
                wrappedAccounts.map { $0.stone.getTotal() + Int($0.currentStone) }.reduce(0, +)
            )
        case .gold:
            return getRssValue(
                wrappedAccounts.map { $0.gold.getTotal() + Int($0.currentGold) }.reduce(0, +)
            )
        case .gems:
            return getRssValue(
                wrappedAccounts.map { $0.gems.getTotal() + Int($0.currentGems) }.reduce(0, +)
            )
        }
    }
    
    private func getRssValue(_ value: Int) -> String {
        if value >= 1000000000 {
            let newValue = Double(value) / 1000000000
            return "\(String(format: "%.1f", newValue))B"
        } else if value >= 1000000 {
            let newValue = Double(value) / 1000000
            return "\(String(format: "%.1f", newValue))M"
        } else if value >= 1000 {
            let newValue = Double(value) / 1000
            return "\(String(format: "%.0f", newValue))K"
        } else {
            return String(value)
        }
    }
}

// MARK: Generated accessors for accounts
extension Kingdom {

    @objc(addAccountsObject:)
    @NSManaged public func addToAccounts(_ value: Account)

    @objc(removeAccountsObject:)
    @NSManaged public func removeFromAccounts(_ value: Account)

    @objc(addAccounts:)
    @NSManaged public func addToAccounts(_ values: NSSet)

    @objc(removeAccounts:)
    @NSManaged public func removeFromAccounts(_ values: NSSet)

}

extension Kingdom : Identifiable {

}
