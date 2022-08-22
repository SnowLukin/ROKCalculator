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
    
    @State private var headerHeight: CGFloat = 0
    @State private var headerOffset: CGFloat = 0
    @State private var lastHeaderOffset: CGFloat = 0
    @State private var swipeDirection: SwipeDirection = .none
    // Value from where it shifted Up/Down
    @State private var shiftOffset: CGFloat = 0
    
    @State private var hideStatusBar: Bool = true
    
    var body: some View {
            ZStack {
                Color("background").ignoresSafeArea()
                TabSectionView(
                    viewModel: viewModel,
                    kingdom: kingdom,
                    headerHeight: $headerHeight,
                    headerOffset: $headerOffset,
                    lastHeaderOffset: $lastHeaderOffset,
                    swipeDirection: $swipeDirection,
                    shiftOffset: $shiftOffset,
                    showAccountCreationView: $showAccountCreationView,
                    animationID: animationID
                )
            }
            .ignoresSafeArea(.all, edges: .top)
            .coordinateSpace(name: "KingdomViewScroll")
            .overlay(alignment: .top) {
                if viewModel.selectedAccount == nil {
                    header
                        .anchorPreference(key: HeaderBoundKey.self, value: .bounds) { $0 }
                        .overlayPreferenceValue(HeaderBoundKey.self) { value in
                            GeometryReader { proxy in
                                if let anchor = value {
                                    Color.clear
                                        .onAppear {
                                            // Retreiving rect using proxy
                                            headerHeight = proxy[anchor].height
                                        }
                                }
                            }
                        }
                        .offset(
                            y: -headerOffset < headerHeight
                            ? headerOffset
                            : (headerOffset < 0 ? headerOffset : 0)
                        )
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .onAppear {
                if headerOffset >= -1.0 {
                    withAnimation {
                        hideStatusBar = true
                    }
                } else {
                    withAnimation {
                        hideStatusBar = false
                    }
                }
            }
            .onChange(of: headerOffset, perform: { newValue in
                if round(newValue) >= -1.0 {
                    withAnimation {
                        hideStatusBar = true
                    }
                } else {
                    withAnimation {
                        hideStatusBar = false
                    }
                }
            })
//            .statusBarStyle(hidden: $hideStatusBar)
    }
}

extension KingdomView {
    private var header: some View {
        VStack {
            kingdomTitle
                .padding(.horizontal)
            HStack(spacing: 0) {
                TabButtonView(
                    viewModel: viewModel,
                    tab: .total,
                    animationID: animationID
                )
                TabButtonView(
                    viewModel: viewModel,
                    tab: .accounts,
                    animationID: animationID
                )
            }.padding(.top, 5)
        }.padding(.top)
            .padding(.top, safeArea().top)
            .background(Color("box"))
    }
    
    private var kingdomTitle: some View {
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
