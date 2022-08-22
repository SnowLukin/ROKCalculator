//
//  TabButtonView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 28.07.2022.
//

import SwiftUI

struct TabButtonView: View {
    @ObservedObject var viewModel: KingdomViewModel
    
    @Binding var currentTab: TabStates
    let tab: TabStates
    var animationID: Namespace.ID
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button {
            withAnimation {
                currentTab = tab
            }
        } label: {
            VStack {
                Text(tab.rawValue)
                    .fontWeight(.semibold)
                    .foregroundColor(
                        currentTab == tab
                        ? .white
                        : Color("background")
                    )
                
                if currentTab == tab {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.white)
                        .matchedGeometryEffect(id: "kingdomTabAnimation", in: animationID)
                        .frame(
                            width: UIScreen.main.bounds.width / 2 - 50,
                            height: 3
                        )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        return KingdomView(
            kingdom: kingdom,
            showKingdomsList: .constant(false),
            showAccountCreationView: .constant(false)
        ).environment(\.managedObjectContext, context)
            .environmentObject(KingdomViewModel())
    }
}
