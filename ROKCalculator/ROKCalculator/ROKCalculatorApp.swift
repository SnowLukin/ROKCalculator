//
//  ROKCalculatorApp.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import SwiftUI

@main
struct ROKCalculatorApp: App {
    let persistenceController = PersistenceController.preview

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
