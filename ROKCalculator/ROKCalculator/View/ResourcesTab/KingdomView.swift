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

enum SwipeDirection {
    case up
    case down
    case none
}

struct KingdomView: View {
    
    @ObservedObject var kingdom: Kingdom
    @Binding var showKingdomsList: Bool
    @Binding var showAccountCreationView: Bool
    
    @EnvironmentObject private var viewModel: KingdomViewModel
    @Namespace private var animationID
    @State private var currentTab: TabStates = .total
    @State private var hideHeader = false
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack(spacing: 0) {
                VStack {
                    if !hideHeader {
                        header()
                    }
                    sectionButtons()
                }
                .padding(.top, safeArea().top)
                .background(Color("box"))
                TabSectionView(
                    viewModel: viewModel,
                    kingdom: kingdom, hideHeader: $hideHeader,
                    currentTab: $currentTab,
                    showAccountCreationView: $showAccountCreationView,
                    animationID: animationID
                )
            }
        }.ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

extension KingdomView {
    @ViewBuilder
    private func sectionButtons() -> some View {
        HStack(spacing: 0) {
            TabButtonView(
                viewModel: viewModel,
                currentTab: $currentTab,
                tab: .total,
                animationID: animationID
            )
            TabButtonView(
                viewModel: viewModel,
                currentTab: $currentTab,
                tab: .accounts,
                animationID: animationID
            )
        }.padding(.top, 5)
    }
    
    @ViewBuilder
    private func header() -> some View {
        VStack {
            HStack {
                Text("**Kingdom #\(String(kingdom.name))**")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    withAnimation {
                        showKingdomsList.toggle()
                    }
                } label: {
                    Image(systemName: "arrow.left.arrow.right.square.fill")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            Text("\(kingdom.wrappedAccounts.count) accounts")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct KingdomView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        KingdomView(kingdom: kingdom, showKingdomsList: .constant(false), showAccountCreationView: .constant(false))
            .environment(\.managedObjectContext, context)
            .environmentObject(KingdomViewModel())
    }
}
