//
//  RssContainerViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//

import Foundation
import CoreData

enum TextfieldSelection: String, Hashable, CaseIterable {
    // Food
    case foodOne = "food1"
    case foodTwo = "food2"
    case foodThree = "food3"
    case foodFour = "food4"
    case foodFive = "food5"
    case foodSix = "food6"
    case foodSeven = "food7"
    // Wood
    case woodOne = "wood1"
    case woodTwo = "wood2"
    case woodThree = "wood3"
    case woodFour = "wood4"
    case woodFive = "wood5"
    case woodSix = "wood6"
    case woodSeven = "wood7"
    // Stone
    case stoneOne = "stone1"
    case stoneTwo = "stone2"
    case stoneThree = "stone3"
    case stoneFour = "stone4"
    case stoneFive = "stone5"
    case stoneSix = "stone6"
    case stoneSeven = "stone7"
    // Gold
    case goldOne = "gold1"
    case goldTwo = "gold2"
    case goldThree = "gold3"
    case goldFour = "gold4"
    case goldFive = "gold5"
    case goldSix = "gold6"
    case goldSeven = "gold7"
    // Gems
    case gemOne = "gem1"
    case gemTwo = "gem2"
    case gemThree = "gem3"
    case gemFour = "gem4"
    case gemFive = "gem5"
    case gemSix = "gem6"
    case gemSeven = "gem7"
    case gemEight = "gem8"
    case gemNine = "gem9"
    // Current
    case currentFood = "foodItem"
    case currentWood = "woodItem"
    case currentStone = "stoneItem"
    case currentGold = "goldItem"
    case currentGems = "gemItem"
    // Pick one chest
    case chestOne = "pickChest1"
    case chestTwo = "pickChest2"
    case chestThree = "pickChest3"
    case chestFour = "pickChest4"
}

class AccountViewModel: ObservableObject {
    
    @Published var selectedBundle: (RssType, RssLvl)?
    @Published var currentTag: TagType = .current
    @Published var selectedTextField: TextfieldSelection?
    
    func getLevelArray(rssType: RssType) -> [RssLvl] {
        switch rssType {
        case .gems:
            return RssLvl.allCases
        default:
            return RssLvl.allCases.dropLast(2)
        }
    }
    
    func getImageName(_ selection: TextfieldSelection) -> String {
        switch selection {
        case .foodOne:
            return "food1"
        case .foodTwo:
            return "food2"
        case .foodThree:
            return "food3"
        case .foodFour:
            return "food4"
        case .foodFive:
            return "food5"
        case .foodSix:
            return "food6"
        case .foodSeven:
            return "food7"
        case .woodOne:
            return "wood1"
        case .woodTwo:
            return "wood2"
        case .woodThree:
            return "wood3"
        case .woodFour:
            return "wood4"
        case .woodFive:
            return "wood5"
        case .woodSix:
            return "wood6"
        case .woodSeven:
            return "wood7"
        case .stoneOne:
            return "stone1"
        case .stoneTwo:
            return "stone2"
        case .stoneThree:
            return "stone3"
        case .stoneFour:
            return "stone4"
        case .stoneFive:
            return "stone5"
        case .stoneSix:
            return "stone6"
        case .stoneSeven:
            return "stone7"
        case .goldOne:
            return "gold1"
        case .goldTwo:
            return "gold2"
        case .goldThree:
            return "gold3"
        case .goldFour:
            return "gold4"
        case .goldFive:
            return "gold5"
        case .goldSix:
            return "gold6"
        case .goldSeven:
            return "gold7"
        case .gemOne:
            return "gem1"
        case .gemTwo:
            return "gem2"
        case .gemThree:
            return "gem3"
        case .gemFour:
            return "gem4"
        case .gemFive:
            return "gem5"
        case .gemSix:
            return "gem6"
        case .gemSeven:
            return "gem7"
        case .gemEight:
            return "gem8"
        case .gemNine:
            return "gem9"
        case .currentFood:
            return "foodItem"
        case .currentWood:
            return "woodItem"
        case .currentStone:
            return "stoneItem"
        case .currentGold:
            return "goldItem"
        case .currentGems:
            return "gemItem"
        case .chestOne:
            return "pickChest1"
        case .chestTwo:
            return "pickChest1"
        case .chestThree:
            return "pickChest2"
        case .chestFour:
            return "pickChest2"
        }
    }
    func getValue(_ selection: TextfieldSelection, account: Account) -> Int {
        switch selection {
        case .foodOne:
            return Int(account.food.one)
        case .foodTwo:
            return Int(account.food.two)
        case .foodThree:
            return Int(account.food.three)
        case .foodFour:
            return Int(account.food.four)
        case .foodFive:
            return Int(account.food.five)
        case .foodSix:
            return Int(account.food.six)
        case .foodSeven:
            return Int(account.food.seven)
        case .woodOne:
            return Int(account.wood.one)
        case .woodTwo:
            return Int(account.wood.two)
        case .woodThree:
            return Int(account.wood.three)
        case .woodFour:
            return Int(account.wood.four)
        case .woodFive:
            return Int(account.wood.five)
        case .woodSix:
            return Int(account.wood.six)
        case .woodSeven:
            return Int(account.wood.seven)
        case .stoneOne:
            return Int(account.stone.one)
        case .stoneTwo:
            return Int(account.stone.two)
        case .stoneThree:
            return Int(account.stone.three)
        case .stoneFour:
            return Int(account.stone.four)
        case .stoneFive:
            return Int(account.stone.five)
        case .stoneSix:
            return Int(account.stone.six)
        case .stoneSeven:
            return Int(account.stone.seven)
        case .goldOne:
            return Int(account.gold.one)
        case .goldTwo:
            return Int(account.gold.two)
        case .goldThree:
            return Int(account.gold.three)
        case .goldFour:
            return Int(account.gold.four)
        case .goldFive:
            return Int(account.gold.five)
        case .goldSix:
            return Int(account.gold.six)
        case .goldSeven:
            return Int(account.gold.seven)
        case .gemOne:
            return Int(account.gems.one)
        case .gemTwo:
            return Int(account.gems.two)
        case .gemThree:
            return Int(account.gems.three)
        case .gemFour:
            return Int(account.gems.four)
        case .gemFive:
            return Int(account.gems.five)
        case .gemSix:
            return Int(account.gems.six)
        case .gemSeven:
            return Int(account.gems.seven)
        case .gemEight:
            return Int(account.gems.eight)
        case .gemNine:
            return Int(account.gems.nine)
        case .currentFood:
            return Int(account.currentFood)
        case .currentWood:
            return Int(account.currentWood)
        case .currentStone:
            return Int(account.currentStone)
        case .currentGold:
            return Int(account.currentGold)
        case .currentGems:
            return Int(account.currentGems)
        case .chestOne:
            return Int(account.pickChests.one)
        case .chestTwo:
            return Int(account.pickChests.two)
        case .chestThree:
            return Int(account.pickChests.three)
        case .chestFour:
            return Int(account.pickChests.four)
        }
    }
    func setValue(_ value: Int, selection: TextfieldSelection, account: Account, viewContext: NSManagedObjectContext) {
        switch selection {
        case .foodOne:
            account.food.one = Int64(value)
        case .foodTwo:
            account.food.two = Int64(value)
        case .foodThree:
            account.food.three = Int64(value)
        case .foodFour:
            account.food.four = Int64(value)
        case .foodFive:
            account.food.five = Int64(value)
        case .foodSix:
            account.food.six = Int64(value)
        case .foodSeven:
            account.food.seven = Int64(value)
        case .woodOne:
            account.wood.one = Int64(value)
        case .woodTwo:
            account.wood.two = Int64(value)
        case .woodThree:
            account.wood.three = Int64(value)
        case .woodFour:
            account.wood.four = Int64(value)
        case .woodFive:
            account.wood.five = Int64(value)
        case .woodSix:
            account.wood.six = Int64(value)
        case .woodSeven:
            account.wood.seven = Int64(value)
        case .stoneOne:
            account.stone.one = Int64(value)
        case .stoneTwo:
            account.stone.two = Int64(value)
        case .stoneThree:
            account.stone.three = Int64(value)
        case .stoneFour:
            account.stone.four = Int64(value)
        case .stoneFive:
            account.stone.five = Int64(value)
        case .stoneSix:
            account.stone.six = Int64(value)
        case .stoneSeven:
            account.stone.seven = Int64(value)
        case .goldOne:
            account.gold.one = Int64(value)
        case .goldTwo:
            account.gold.two = Int64(value)
        case .goldThree:
            account.gold.three = Int64(value)
        case .goldFour:
            account.gold.four = Int64(value)
        case .goldFive:
            account.gold.five = Int64(value)
        case .goldSix:
            account.gold.six = Int64(value)
        case .goldSeven:
            account.gold.seven = Int64(value)
        case .gemOne:
            account.gems.one = Int64(value)
        case .gemTwo:
            account.gems.two = Int64(value)
        case .gemThree:
            account.gems.three = Int64(value)
        case .gemFour:
            account.gems.four = Int64(value)
        case .gemFive:
            account.gems.five = Int64(value)
        case .gemSix:
            account.gems.six = Int64(value)
        case .gemSeven:
            account.gems.seven = Int64(value)
        case .gemEight:
            account.gems.eight = Int64(value)
        case .gemNine:
            account.gems.nine = Int64(value)
        case .currentFood:
            account.currentFood = Int64(value)
        case .currentWood:
            account.currentWood = Int64(value)
        case .currentStone:
            account.currentStone = Int64(value)
        case .currentGold:
            account.currentGold = Int64(value)
        case .currentGems:
            account.currentGems = Int64(value)
        case .chestOne:
            account.pickChests.one = Int64(value)
        case .chestTwo:
            account.pickChests.two = Int64(value)
        case .chestThree:
            account.pickChests.three = Int64(value)
        case .chestFour:
            account.pickChests.four = Int64(value)
        }
        print("Preparing to save")
        do {
            try viewContext.save()
            print("New value saved. \(account.name) -> \(value) for \(selection.rawValue)")
        } catch {
            print("Failed updating account's resource value.")
        }
    }
}
