//
//  TabButtonView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 28.07.2022.
//

import SwiftUI

struct TabButtonView: View {
    @ObservedObject var viewModel: KingdomViewModel
    @Environment(\.colorScheme) private var colorScheme
    let tab: TabStates
    var animationID: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation {
                viewModel.currentTab = tab
            }
        } label: {
            VStack {
                Text(tab.rawValue)
                    .fontWeight(.semibold)
                    .foregroundColor(
                        viewModel.currentTab == tab
                        ? .primary
                        : .gray
                    )
                
                if viewModel.currentTab == tab {
                    Rectangle()
                        .fill(
                            colorScheme == .dark
                            ? .white
                            : .black
                        )
                        .matchedGeometryEffect(id: "TAB", in: animationID)
                        .frame(
                            width: UIScreen.main.bounds.width / 2 - 50,
                            height: 1
                        )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = RssCalculatorViewModel()
        let kingdom = appViewModel.kingdoms[0]
        KingdomView(viewModel: KingdomViewModel(), kingdom: kingdom)
    }
}
