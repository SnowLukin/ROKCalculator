//
//  AccountCreationViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI
import CoreData

class AccountCreationViewModel: ObservableObject {
    func createAccount(_ name: String, isMain: Bool, kingdom: Kingdom, viewContext: NSManagedObjectContext) {
        let newAccount = Account(context: viewContext)
        newAccount.initValues(name: name, isMain: isMain)
        
        newAccount.food = Food(context: viewContext)
        newAccount.food.initValues(account: newAccount)
        
        newAccount.wood = Wood(context: viewContext)
        newAccount.wood.initValues(account: newAccount)
        
        newAccount.stone = Stone(context: viewContext)
        newAccount.stone.initValues(account: newAccount)
        
        newAccount.gold = Gold(context: viewContext)
        newAccount.gold.initValues(account: newAccount)
        
        newAccount.gems = Gems(context: viewContext)
        newAccount.gems.initValues(account: newAccount)
        
        newAccount.vip = VIP(context: viewContext)
        newAccount.vip.initValues(account: newAccount)
        
        newAccount.actionPoints = ActionPoints(context: viewContext)
        newAccount.actionPoints.initValues(account: newAccount)
        
        newAccount.pickChests = PickOneChest(context: viewContext)
        newAccount.pickChests.initValues(account: newAccount)
        
        newAccount.materials = Materials(context: viewContext)
        newAccount.materials.initValues(account: newAccount)
        
        kingdom.addToAccounts(newAccount)
        
        do {
            try viewContext.save()
            print("Account saved successfully.")
        } catch {
            print("Failed saving new account.")
            print(error.localizedDescription)
        }
    }
}
