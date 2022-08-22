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
    
    @Binding var headerHeight: CGFloat
    @Binding var headerOffset: CGFloat
    
    @Binding var lastHeaderOffset: CGFloat
    @Binding var swipeDirection: SwipeDirection
    // Value from where it shifted Up/Down
    @Binding var shiftOffset: CGFloat
    
    @Binding var showAccountCreationView: Bool
    
    var animationID: Namespace.ID
    
    @State private var safeArea: UIEdgeInsets = .zero
    
    private var sortedAccounts: [Account] {
        return kingdom.wrappedAccounts.sorted { firstAccount, secondAccount in
            return firstAccount.isMain
        }
    }
    
    var body: some View {
        TabView(selection: $viewModel.currentTab) {
            totalPage().tag(TabStates.total)
            accountPage().tag(TabStates.accounts)
        }.tabViewStyle(.page(indexDisplayMode: .never))
        .background(.red)
        .sheet(isPresented: $showAccountCreationView) {
            AccountCreationView(kingdom: kingdom)
        }
        .onAppear {
            print("appeared")
            safeArea = safeArea()
        }
        .onDisappear {
            print("disappeared")
//            safeArea = safeArea()
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
            TotalTabView(kingdom: kingdom)
                .padding(.top, headerHeight - safeArea.top / 2)
                .offsetY { previous, current in
                    // Moving header based on direction scroll
                    if previous > current {
                        // Up
                        if swipeDirection != .up && current < 0 {
                            shiftOffset = current - headerOffset
                            swipeDirection = .up
                            lastHeaderOffset = headerOffset
                        }
                        
                        let offset = current < 0 ? (current - shiftOffset) : 0
                        // Checking to not go over the header height
                        headerOffset = -offset < headerHeight
                        ? (offset < 0 ? offset : 0)
                        : -headerHeight
                    } else {
                        // Down
                        if swipeDirection != .down {
                            shiftOffset = current
                            swipeDirection = .down
                            lastHeaderOffset = headerOffset
                        }
                        
                        let offset = lastHeaderOffset + (current - shiftOffset)
                        headerOffset = offset > 0 ? 0 : offset
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
        }
    }
    
    @ViewBuilder
    private func accountPage() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            AccountListView(kingdom: kingdom)
                .padding(.top, headerHeight - safeArea.top / 2)
                .offsetY { previous, current in
                    // Moving header based on direction scroll
                    if previous > current {
                        // Up
                        if swipeDirection != .up && current < 0 {
                            shiftOffset = current - headerOffset
                            swipeDirection = .up
                            lastHeaderOffset = headerOffset
                        }
                        
                        let offset = current < 0 ? (current - shiftOffset) : 0
                        // Checking to not go over the header height
                        headerOffset = -offset < headerHeight
                        ? (offset < 0 ? offset : 0)
                        : -headerHeight
                    } else {
                        // Down
                        if swipeDirection != .down {
                            shiftOffset = current
                            swipeDirection = .down
                            lastHeaderOffset = headerOffset
                        }
                        
                        let offset = lastHeaderOffset + (current - shiftOffset)
                        headerOffset = offset > 0 ? 0 : offset
                    }
                }
                .padding(.bottom, 100)
        }
    }
}
