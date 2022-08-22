//
//  SampleData.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 02.08.2022.
//

import Foundation
import CoreData

struct SampleData {
    
    func prepareData(for context: NSManagedObjectContext) {
//        let snow = Account(context: context)
//        let typical = Account(context: context)
//        let hp = Account(context: context)
//        let valk = Account(context: context)
        
        let loSnow = Account(context: context)
        let typicalFarm = Account(context: context)
        let hpFarm = Account(context: context)
        let hpFarm2 = Account(context: context)
        let veTrix = Account(context: context)
        let snow5 = Account(context: context)
        
        prepareAccount(
            loSnow, for: context, name: "LO Snow", isMain: true,
            currentFood: 441_700_000, currentWood: 257_000_000, currentStone: 253_200_000, currentGold: 354_500_000, currentGems: 38_151,
            foodOne: 43972, foodTwo: 788, foodThree: 232, foodFour: 103, foodFive: 69, foodSix: 2, foodSeven: 0,
            woodOne: 86169, woodTwo: 2917, woodThree: 683, woodFour: 191, woodFive: 195, woodSix: 3, woodSeven: 0,
            stoneOne: 502135, stoneTwo: 6570, stoneThree: 683, stoneFour: 175, stoneFive: 233, stoneSix: 2, stoneSeven: 0,
            goldOne: 22174, goldTwo: 384, goldThree: 46, goldFour: 168, goldFive: 10, goldSix: 0, goldSeven: 0,
            gemsOne: 77, gemsTwo: 73, gemsThree: 3, gemsFour: 8, gemsSeven: 11, chestOne: 63845, chestTwo: 688, chestThree: 144, chestFour: 68
        )
        
        prepareAccount(
            typicalFarm, for: context, name: "NonTypicalFarm", isMain: false,
            currentFood: 57_500_000, currentWood: 20_700_000, currentStone: 19_600_000, currentGold: 170_500_000,
            foodOne: 415, foodTwo: 118, foodThree: 98, foodFour: 15, foodFive: 22,
            woodOne: 456, woodTwo: 354, woodThree: 128, woodFour: 26, woodFive: 18,
            stoneOne: 464, stoneTwo: 430, stoneThree: 23, stoneFour: 23, stoneFive: 17,
            goldOne: 63, goldTwo: 441, goldThree: 13, goldFour: 10, goldFive: 20,
            chestOne: 1046, chestTwo: 75, chestThree: 20, chestFour: 5
        )
        
        prepareAccount(
            hpFarm, for: context, name: "HiPitchedFarm", isMain: false,
            currentFood: 55_500_000, currentWood: 13_400_000, currentStone: 3_200_000, currentGold: 160_300_000,
            foodOne: 458, foodTwo: 318, foodThree: 123, foodFour: 15, foodFive: 30,
            woodOne: 416, woodTwo: 331, woodThree: 95, woodFour: 40, woodFive: 17,
            stoneOne: 671, stoneTwo: 510, stoneThree: 25, stoneFour: 41, stoneFive: 12,
            goldOne: 35, goldTwo: 316, goldThree: 11, goldFour: 4, goldFive: 44,
            chestOne: 1877, chestTwo: 128, chestThree: 20, chestFour: 26
        )
        prepareAccount(
            hpFarm2, for: context, name: "HiPitchedFarm2", isMain: false,
            currentFood: 141_700_000, currentWood: 13_200_000, currentStone: 3_700_000, currentGold: 150_300_000,
            foodOne: 1585, foodTwo: 211, foodThree: 153, foodFour: 11, foodFive: 21, foodSix: 20,
            woodOne: 4420, woodTwo: 1177, woodThree: 285, woodFour: 74, woodFive: 12,
            stoneOne: 4678, stoneTwo: 1211, stoneThree: 80, stoneFour: 66, stoneFive: 35,
            goldOne: 838, goldTwo: 674, goldThree: 15, goldFour: 12, goldFive: 20,
            chestOne: 229, chestTwo: 128, chestThree: 20, chestFour: 80
        )
        
        prepareAccount(
            veTrix, for: context, name: "Ve Trix", isMain: false,
            currentFood: 178_700_000, currentWood: 117_200_000, currentStone: 55_700_000, currentGold: 156_800_000,
            foodOne: 4000, foodTwo: 422, foodThree: 216, foodFour: 27, foodFive: 28,
            woodOne: 10653, woodTwo: 1233, woodThree: 229, woodFour: 20, woodFive: 22,
            stoneOne: 21192, stoneTwo: 2699, stoneThree: 101, stoneFour: 99, stoneFive: 1,
            goldOne: 882, goldTwo: 722, goldThree: 13, goldFour: 1, goldFive: 17,
            chestOne: 15684, chestTwo: 1944, chestThree: 15, chestFour: 102
        )
        
        prepareAccount(
            snow5, for: context, name: "SnowsFarm5", isMain: false,
            currentFood: 4_700_000, currentWood: 1_500_000, currentStone: 1_700_000, currentGold: 56_800_000,
            foodOne: 24, foodTwo: 120, foodThree: 27, foodFour: 10,
            woodOne: 78, woodTwo: 216, woodFour: 3,
            stoneOne: 121, stoneTwo: 282, stoneThree: 4, stoneFour: 4,
            goldOne: 30, goldTwo: 76, goldThree: 4, goldFour: 1, goldFive: 40,
            chestOne: 5, chestTwo: 3, chestThree: 5
        )
        
        let kingdom = Kingdom(context: context)
        kingdom.initValues(name: 1228, accounts: [])
        kingdom.addToAccounts(loSnow)
        kingdom.addToAccounts(typicalFarm)
        kingdom.addToAccounts(hpFarm)
        kingdom.addToAccounts(hpFarm2)
        kingdom.addToAccounts(veTrix)
        kingdom.addToAccounts(snow5)
        let kingdom2 = Kingdom(context: context)
        kingdom2.initValues(name: 2073, accounts: [])
        
        do {
            try context.save()
        } catch {
            // handle error for production
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func prepareAccount(
        _ account: Account, for context: NSManagedObjectContext,
        name: String, isMain: Bool = true, currentFood: Int = 0, currentWood: Int = 0, currentStone: Int = 0, currentGold: Int = 0, currentGems: Int = 0,
        foodOne: Int = 0, foodTwo: Int = 0, foodThree: Int = 0, foodFour: Int = 0, foodFive: Int = 0, foodSix: Int = 0, foodSeven: Int = 0,
        woodOne: Int = 0, woodTwo: Int = 0, woodThree: Int = 0, woodFour: Int = 0, woodFive: Int = 0, woodSix: Int = 0, woodSeven: Int = 0,
        stoneOne: Int = 0, stoneTwo: Int = 0, stoneThree: Int = 0, stoneFour: Int = 0, stoneFive: Int = 0, stoneSix: Int = 0, stoneSeven: Int = 0,
        goldOne: Int = 0, goldTwo: Int = 0, goldThree: Int = 0, goldFour: Int = 0, goldFive: Int = 0, goldSix: Int = 0, goldSeven: Int = 0,
        gemsOne: Int = 0, gemsTwo: Int = 0, gemsThree: Int = 0, gemsFour: Int = 0, gemsFive: Int = 0, gemsSix: Int = 0, gemsSeven: Int = 0,
        gemsEight: Int = 0, gemsNine: Int = 0, chestOne: Int = 0, chestTwo: Int = 0, chestThree: Int = 0, chestFour: Int = 0
    ) {
        account.initValues(
            name: name, isMain: isMain, currentFood: currentFood,
            currentWood: currentWood, currentStone: currentStone, currentGold: currentGold, currentGems: currentGems
        )
        
        account.food = Food(context: context)
        account.food.initValues(one: foodOne, two: foodTwo, three: foodThree, four: foodFour, five: foodFive, six: foodSix, seven: foodSeven, account: account)
        
        account.wood = Wood(context: context)
        account.wood.initValues(one: woodOne, two: woodTwo, three: woodThree, four: woodFour, five: woodFive, six: woodSix, seven: woodSeven, account: account)
        
        account.stone = Stone(context: context)
        account.stone.initValues(one: stoneOne, two: stoneTwo, three: stoneThree, four: stoneFour, five: stoneFive, six: stoneSix, seven: stoneSeven, account: account)
        
        account.gold = Gold(context: context)
        account.gold.initValues(one: goldOne, two: goldTwo, three: goldThree, four: goldFour, five: goldFive, six: goldSix, seven: goldSeven, account: account)
        
        account.gems = Gems(context: context)
        account.gems.initValues(one: gemsOne, two: gemsTwo, three: gemsThree, four: gemsFour, five: gemsFive, six: gemsSix, seven: gemsSeven, eight: gemsEight, nine: gemsNine, account: account)
        
        account.vip = VIP(context: context)
        account.vip.initValues(account: account)
        
        account.actionPoints = ActionPoints(context: context)
        account.actionPoints.initValues(account: account)
        
        account.pickChests = PickOneChest(context: context)
        account.pickChests.initValues(one: chestOne, two: chestTwo, three: chestThree, four: chestFour, account: account)
        
        account.materials = Materials(context: context)
        account.materials.initValues(account: account)
    }
    
}
