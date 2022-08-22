//
//  Account+CoreDataProperties.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var name: String
    @NSManaged public var isMain: Bool
    @NSManaged public var power: Int64
    @NSManaged public var currentVip: Int64
    @NSManaged public var killPoints: Int64
    @NSManaged public var currentFood: Int64
    @NSManaged public var currentWood: Int64
    @NSManaged public var currentStone: Int64
    @NSManaged public var currentGold: Int64
    @NSManaged public var currentGems: Int64
    @NSManaged public var kingdom: Kingdom
    @NSManaged public var food: Food
    @NSManaged public var wood: Wood
    @NSManaged public var stone: Stone
    @NSManaged public var gold: Gold
    @NSManaged public var gems: Gems
    @NSManaged public var vip: VIP
    @NSManaged public var materials: Materials
    @NSManaged public var pickChests: PickOneChest
    @NSManaged public var actionPoints: ActionPoints

    func initValues(
        name: String, isMain: Bool = true, power: Int = 0,
        killPoints: Int = 0, currentVip: Int = 0, currentFood: Int = 0,
        currentWood: Int = 0, currentStone: Int = 0, currentGold: Int = 0,
        currentGems: Int = 0
    ) {
        self.name = name
        self.isMain = isMain
        self.power = Int64(power)
        self.killPoints = Int64(killPoints)
        self.currentVip = Int64(currentVip)
        self.currentFood = Int64(currentFood)
        self.currentWood = Int64(currentWood)
        self.currentStone = Int64(currentStone)
        self.currentGold = Int64(currentGold)
        self.currentGems = Int64(currentGems)
    }
    
    var foodBundleValue: String {
        getRssValue(food.getTotal())
    }
    
    var woodBundleValue: String {
        getRssValue(wood.getTotal())
    }
    
    var stoneBundleValue: String {
        getRssValue(stone.getTotal())
    }
    
    var goldBundleValue: String {
        getRssValue(gold.getTotal())
    }
    
    var gemsBundleValue: String {
        getRssValue(gems.getTotal())
    }
    
    var foodValue: String {
        getRssValue(food.getTotal() + Int(currentFood))
    }
    var woodValue: String {
        getRssValue(wood.getTotal() + Int(currentWood))
    }
    var stoneValue: String {
        getRssValue(stone.getTotal() + Int(currentStone))
    }
    var goldValue: String {
        getRssValue(gold.getTotal() + Int(currentGold))
    }
    var gemsValue: String {
        getRssValue(gems.getTotal() + Int(currentGems))
    }
    
    var currentFoodValue: String {
        getRssValue(Int(currentFood))
    }
    
    var currentWoodValue: String {
        getRssValue(Int(currentWood))
    }
    
    var currentStoneValue: String {
        getRssValue(Int(currentStone))
    }
    
    var currentGoldValue: String {
        getRssValue(Int(currentGold))
    }
    
    var currentGemsValue: String {
        getRssValue(Int(currentGems))
    }
    
    func totalChestValue(of type: RssType) -> String {
        getRssValue(pickChests.totalValue(of: type))
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

extension Account : Identifiable {

}
