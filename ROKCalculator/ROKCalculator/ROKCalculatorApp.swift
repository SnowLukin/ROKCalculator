//
//  ROKCalculatorApp.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import SwiftUI

@main
struct ROKCalculatorApp: App {
    @StateObject private var viewModel = RssCalculatorViewModel()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            KingdomView(kingdom: viewModel.kingdoms[0])
                .environmentObject(RssCalculatorViewModel())
        }
    }
}
