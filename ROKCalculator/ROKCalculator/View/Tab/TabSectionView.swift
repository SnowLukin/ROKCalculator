//
//  TabSectionView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 28.07.2022.
//

import SwiftUI

struct TabSectionView: View {
    @ObservedObject var viewModel: KingdomViewModel
    let kingdom: Kingdom
    
    var body: some View {
        ZStack {
            switch viewModel.currentTab {
            case .total:
                TotalTabView(kingdom: kingdom)
                    .padding(.horizontal)
                    .padding(.top)
                .transition(
                    AnyTransition.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)
                    )
                )
            case .accounts:
                VStack {
                    ForEach(kingdom.accounts) { account in
                        AccountRowView(account: account)
                            .padding(.horizontal)
                    }
                }.transition(
                    AnyTransition.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)
                    )
                )
            }
        }
    }
}


struct TabSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = RssCalculatorViewModel()
        let kingdom = appViewModel.kingdoms[0]
        KingdomView(viewModel: KingdomViewModel(), kingdom: kingdom)
    }
}
