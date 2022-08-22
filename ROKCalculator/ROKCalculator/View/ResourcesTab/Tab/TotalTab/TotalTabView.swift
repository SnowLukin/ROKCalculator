//
//  TotalTabView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct TotalTabView: View {
    
    @ObservedObject var kingdom: Kingdom
    @Binding var currentTab: TabStates
    
    
    var body: some View {
        VStack {
            TotalTabPreviewView(kingdom: kingdom)
            if !kingdom.wrappedAccounts.isEmpty {
                TotalTabDetailView(kingdom: kingdom, currentTab: $currentTab)
            }
        }
    }
}

struct TotalTabView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        return TotalTabView(kingdom: kingdom, currentTab: .constant(.total))
            .environment(\.managedObjectContext, context)
    }
}
