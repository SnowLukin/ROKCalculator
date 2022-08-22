//
//  TabSectionView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 28.07.2022.
//

import SwiftUI

struct TabSectionView: View {
    
    @ObservedObject var viewModel: KingdomViewModel
    @ObservedObject var kingdom: Kingdom
    
    @Binding var hideHeader: Bool
    @Binding var currentTab: TabStates
    @Binding var showAccountCreationView: Bool
    
    var animationID: Namespace.ID
    
    @State private var currentPieChartPage = 0
    @State private var pieChartRowsValues: [Double] = []
    
    private var sortedAccounts: [Account] {
        return kingdom.wrappedAccounts.sorted { firstAccount, secondAccount in
            return firstAccount.isMain
        }
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            totalPage().tag(TabStates.total)
            accountPage().tag(TabStates.accounts)
        }.tabViewStyle(.page(indexDisplayMode: .never))
        .sheet(isPresented: $showAccountCreationView) {
            AccountCreationView(kingdom: kingdom)
        }
    }
}


struct TabSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        KingdomView(kingdom: kingdom, showKingdomsList: .constant(false), showAccountCreationView: .constant(false))
            .environment(\.managedObjectContext, context)
            .environmentObject(KingdomViewModel())
    }
}

extension TabSectionView {
    @ViewBuilder
    private func totalPage() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                if currentTab == .total {
                    GeometryReader { reader -> AnyView in
                        
                        let yAxis = reader.frame(in: .global).minY
                        
                        if yAxis < 0 && !hideHeader {
                            DispatchQueue.main.async {
                                withAnimation {
                                    hideHeader.toggle()
                                }
                            }
                        }
                        if yAxis > 0 && hideHeader {
                            DispatchQueue.main.async {
                                withAnimation {
                                    hideHeader.toggle()
                                }
                            }
                        }
                        
                        return AnyView(
                            Text("").frame(width: 0, height: 0)
                        )
                    }.frame(width: 0, height: 0)
                }
                TotalTabView(kingdom: kingdom, currentTab: $currentTab)
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 100)
        }
    }
    
    @ViewBuilder
    private func accountPage() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                if currentTab == .accounts {
                    GeometryReader { reader -> AnyView in
                        
                        let yAxis = reader.frame(in: .global).minY
                        
                        if yAxis < 0 && !hideHeader {
                            DispatchQueue.main.async {
                                withAnimation {
                                    hideHeader.toggle()
                                }
                            }
                        }
                        if yAxis > 0 && hideHeader {
                            DispatchQueue.main.async {
                                withAnimation {
                                    hideHeader.toggle()
                                }
                            }
                        }
                        
                        return AnyView(
                            Text("").frame(width: 0, height: 0)
                        )
                    }.frame(width: 0, height: 0)
                }
                AccountListView(kingdom: kingdom)
            }
                .padding(.bottom, 100)
                .padding(.top)
        }
    }
}
