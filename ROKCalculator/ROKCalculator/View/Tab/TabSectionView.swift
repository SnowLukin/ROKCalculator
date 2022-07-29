//
//  TabSectionView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 28.07.2022.
//

import SwiftUI

struct TabSectionView: View {
    @ObservedObject var viewModel: KingdomViewModel
    @Binding var showAccount: Bool
    let kingdom: Kingdom
    var animationID: Namespace.ID
    
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
                        if account.id != viewModel.selectedAccount?.id {
                            AccountRowView(account: account, animationID: animationID)
                                .padding(.horizontal)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        showAccount.toggle()
                                        viewModel.selectedAccount = account
                                    }
                                }
                        }
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
