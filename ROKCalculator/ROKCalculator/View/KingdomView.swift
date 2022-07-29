//
//  KingdomView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import SwiftUI

enum TabStates: String, CaseIterable {
    case total = "Total"
    case accounts = "Accounts"
}

class KingdomViewModel: ObservableObject {
    @Published var currentTab: TabStates = .accounts
    @Published var tabAnimationID: Int = 0
    @Published var selectedAccount: Account?
    @Published var showAccount = false
}

struct KingdomView: View {
    @StateObject var viewModel = KingdomViewModel()
    @Namespace private var animationID
//    @State private var showAccount: Bool = false
    
    let kingdom: Kingdom
    
    var body: some View {
        ZStack {
            VStack {
                kingdomTitle
                HStack(spacing: 0) {
                    ForEach(TabStates.allCases, id: \.self) { tab in
                        TabButtonView(viewModel: viewModel, tab: tab, animationID: animationID)
                    }
                }.padding(.top, 25)
                Spacer()
                ScrollView(.vertical, showsIndicators: false) {
                    TabSectionView(viewModel: viewModel, showAccount: $viewModel.showAccount, kingdom: kingdom, animationID: animationID)
                }
            }
            
            if viewModel.showAccount {
                if let selectedAccount = viewModel.selectedAccount {
                    AccountView(viewModel: viewModel, showAccount: $viewModel.showAccount, account: selectedAccount, animationID: animationID)
                        .frame(maxHeight: .infinity)
                }
            }
        }.environmentObject(viewModel)
    }
}

extension KingdomView {
    
    private var kingdomTitle: some View {
        VStack {
            HStack {
                Text("**Kingdom #\(String(kingdom.name))**")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left.arrow.right.square.fill")
                        .font(.title)
                        .foregroundColor(Color.gray)
                }
            }
            Text("\(kingdom.accounts.count) accounts")
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.horizontal)
            .padding(.top)
    }
}

struct KingdomView_Previews: PreviewProvider {
    static var previews: some View {
        let appViewModel = RssCalculatorViewModel()
        let kingdom = appViewModel.kingdoms[0]
        return KingdomView(kingdom: kingdom)
            .preferredColorScheme(.dark)
            
    }
}
