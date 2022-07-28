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
}

struct KingdomView: View {
    @StateObject var viewModel = KingdomViewModel()
    @Namespace private var animationID
    
    let kingdom: Kingdom
    
    var body: some View {
        VStack {
            kingdomTitle
            HStack(spacing: 0) {
                ForEach(TabStates.allCases, id: \.self) { tab in
                    TabButtonView(viewModel: viewModel, tab: tab, animationID: animationID)
                }
            }.padding(.top, 25)
            ScrollView(.vertical, showsIndicators: false) {
                TabSectionView(viewModel: viewModel, kingdom: kingdom)
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
        return KingdomView(viewModel: KingdomViewModel(), kingdom: kingdom)
            .preferredColorScheme(.dark)
            .environmentObject(KingdomViewModel())
    }
}
