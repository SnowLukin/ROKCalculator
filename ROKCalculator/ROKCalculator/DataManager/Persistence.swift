//
//  Persistence.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        SampleData().prepareData(for: viewContext)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ROKCalculator")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Error loading CoreData. \(error.localizedDescription)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

extension PersistenceController {
    
    func addFood(
        to account: Account, one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0, seven: Int = 0
    ) {
        let food = Food(context: container.viewContext)
        food.initValues(one: one, two: two, three: three, four: four, five: five, six: six, seven: seven, account: account)
        account.food = food
    }
    
    func addWood(
        to account: Account, one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0, seven: Int = 0
    ) {
        let wood = Wood(context: container.viewContext)
        wood.initValues(one: one, two: two, three: three, four: four, five: five, six: six, seven: seven, account: account)
        account.wood = wood
    }
    
    func addStone(
        to account: Account, one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0, seven: Int = 0
    ) {
        let stone = Stone(context: container.viewContext)
        stone.initValues(one: one, two: two, three: three, four: four, five: five, six: six, seven: seven, account: account)
        account.stone = stone
    }
    
    func addGold(
        to account: Account, one: Int = 0, two: Int = 0, three: Int = 0,
        four: Int = 0, five: Int = 0, six: Int = 0, seven: Int = 0
    ) {
        let gold = Gold(context: container.viewContext)
        gold.initValues(one: one, two: two, three: three, four: four, five: five, six: six, seven: seven, account: account)
        account.gold = gold
    }
    
    func addGems(
        to account: Account, one: Int = 0, two: Int = 0, three: Int = 0, four: Int = 0,
        five: Int = 0, six: Int = 0, seven: Int = 0, eight: Int = 0, nine: Int = 0
    ) {
        let gems = Gems(context: container.viewContext)
        gems.initValues(
            one: one, two: two, three: three, four: four,
            five: five, six: six, seven: seven, eight: eight,
            nine: nine, account: account
        )
        account.gems = gems
    }
    
    func changeResourcesData(_ data: Int, of selection: TextfieldSelection, for account: Account) {
        switch selection {
        case .foodOne:
            account.food.one = Int64(data)
        case .foodTwo:
            account.food.two = Int64(data)
        case .foodThree:
            account.food.three = Int64(data)
        case .foodFour:
            account.food.four = Int64(data)
        case .foodFive:
            account.food.five = Int64(data)
        case .foodSix:
            account.food.six = Int64(data)
        case .foodSeven:
            account.food.seven = Int64(data)
        case .woodOne:
            account.wood.one = Int64(data)
        case .woodTwo:
            account.wood.two = Int64(data)
        case .woodThree:
            account.wood.three = Int64(data)
        case .woodFour:
            account.wood.four = Int64(data)
        case .woodFive:
            account.wood.five = Int64(data)
        case .woodSix:
            account.wood.six = Int64(data)
        case .woodSeven:
            account.wood.seven = Int64(data)
        case .stoneOne:
            account.stone.one = Int64(data)
        case .stoneTwo:
            account.stone.two = Int64(data)
        case .stoneThree:
            account.stone.three = Int64(data)
        case .stoneFour:
            account.stone.four = Int64(data)
        case .stoneFive:
            account.stone.five = Int64(data)
        case .stoneSix:
            account.stone.six = Int64(data)
        case .stoneSeven:
            account.stone.seven = Int64(data)
        case .goldOne:
            account.gold.one = Int64(data)
        case .goldTwo:
            account.gold.two = Int64(data)
        case .goldThree:
            account.gold.three = Int64(data)
        case .goldFour:
            account.gold.four = Int64(data)
        case .goldFive:
            account.gold.five = Int64(data)
        case .goldSix:
            account.gold.six = Int64(data)
        case .goldSeven:
            account.gold.seven = Int64(data)
        case .gemOne:
            account.gems.one = Int64(data)
        case .gemTwo:
            account.gems.two = Int64(data)
        case .gemThree:
            account.gems.three = Int64(data)
        case .gemFour:
            account.gems.four = Int64(data)
        case .gemFive:
            account.gems.five = Int64(data)
        case .gemSix:
            account.gems.six = Int64(data)
        case .gemSeven:
            account.gems.seven = Int64(data)
        case .gemEight:
            account.gems.eight = Int64(data)
        case .gemNine:
            account.gems.nine = Int64(data)
        case .currentFood:
            account.currentFood = Int64(data)
        case .currentWood:
            account.currentWood = Int64(data)
        case .currentStone:
            account.currentStone = Int64(data)
        case .currentGold:
            account.currentGold = Int64(data)
        case .currentGems:
            account.currentGems = Int64(data)
        case .chestOne:
            account.pickChests.one = Int64(data)
        case .chestTwo:
            account.pickChests.two = Int64(data)
        case .chestThree:
            account.pickChests.three = Int64(data)
        case .chestFour:
            account.pickChests.four = Int64(data)
        }
    }
}
