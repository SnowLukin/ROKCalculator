//
//  KingdomCreationViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 15.08.2022.
//

import SwiftUI
import CoreData

class KingdomCreationViewModel: ObservableObject {
    func createKingdom(name: Int, for viewContext: NSManagedObjectContext) {
        let newKingdom = Kingdom(context: viewContext)
        newKingdom.initValues(name: name, accounts: [])
        do {
            try viewContext.save()
            print("Kingdom saved successfully.")
        } catch {
            print("Failed saving new kingdom.")
            print(error.localizedDescription)
        }
    }
}
