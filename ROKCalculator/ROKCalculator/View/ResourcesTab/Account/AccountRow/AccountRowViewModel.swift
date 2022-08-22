//
//  AccountRowViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI
import CoreData

class AccountRowViewModel: ObservableObject {
    func deleteAccount(_ account: Account, viewContext: NSManagedObjectContext) {
        let kingdom = account.kingdom
        kingdom.removeFromAccounts(account)
        viewContext.delete(account)
        do {
            try viewContext.save()
        } catch {
            print("Failed deleting kingdom.")
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
