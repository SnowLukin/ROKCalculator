//
//  Account.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import Foundation

enum AccountType {
    case main
    case farm
}

struct Account: Identifiable {
    let id = UUID()
    var name: String
    var type: AccountType
    var power: Int?
    var killPoints: Int?
    var vip: Int?
    var currentFood: Int
    var currentWood: Int
    var currentStone: Int
    var currentGold: Int
    var currentGems: Int
    var food: Food
    var wood: Wood
    var stone: Stone
    var gold: Gold
    var gems: Gems
    
    
    var actionPoints: ActionPoints
    
    init(name: String, type: AccountType = .main,
         power: Int? = nil, killPoints: Int? = nil, vip: Int? = nil,
         currentFood: Int = 0, currentWood: Int = 0, currentStone: Int = 0, currentGold: Int = 0, currentGems: Int = 0,
         food: Food = Food(), wood: Wood = Wood(),
         stone: Stone = Stone(), gold: Gold = Gold(),
         gems: Gems = Gems(), actionPoints: ActionPoints = ActionPoints()
    ) {
        self.name = name
        self.type = type
        self.power = power
        self.killPoints = killPoints
        self.vip = vip
        self.currentFood = currentFood
        self.currentWood = currentWood
        self.currentStone = currentStone
        self.currentGold = currentGold
        self.currentGems = currentGems
        self.food = food
        self.wood = wood
        self.stone = stone
        self.gold = gold
        self.gems = gems
        self.actionPoints = actionPoints
    }
    
    var foodValue: String {
        getRssValue(food.getTotal())
    }
    
    var woodValue: String {
        getRssValue(wood.getTotal())
    }
    
    var stoneValue: String {
        getRssValue(stone.getTotal())
    }
    
    var goldValue: String {
        getRssValue(gold.getTotal())
    }
    
    var gemsValue: String {
        String(gems.getTotal())
    }
    
    var foodBundleValue: String {
        getRssValue(food.getTotal() + currentFood)
    }
    var woodBundleValue: String {
        getRssValue(wood.getTotal() + currentWood)
    }
    var stoneBundleValue: String {
        getRssValue(stone.getTotal() + currentStone)
    }
    var goldBundleValue: String {
        getRssValue(gold.getTotal() + currentGold)
    }
    var gemsBundleValue: String {
        String(gems.getTotal() + currentGems)
    }
    
    var currentFoodValue: String {
        getRssValue(currentFood)
    }
    
    var currentWoodValue: String {
        getRssValue(currentWood)
    }
    
    var currentStoneValue: String {
        getRssValue(currentStone)
    }
    
    var currentGoldValue: String {
        getRssValue(currentGold)
    }
    
    var currentGemsValue: String {
        String(currentGems)
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
