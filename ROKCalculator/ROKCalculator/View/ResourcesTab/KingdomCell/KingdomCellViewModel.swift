//
//  KingdomCellViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI
import CoreData

class KingdomCellViewModel: ObservableObject {
    func deleteKingdom(_ kingdom: Kingdom, viewContext: NSManagedObjectContext) {
        viewContext.delete(kingdom)
        do {
            try viewContext.save()
        } catch {
            print("Failed deleting kingdom.")
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
