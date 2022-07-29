//
//  AccountView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 27.07.2022.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: KingdomViewModel
    @Binding var showAccount: Bool
    let account: Account
    var animationID: Namespace.ID
    
    @State private var showExtra: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Button {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        showExtra = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                showAccount.toggle()
                                viewModel.selectedAccount = nil
                            }
                        }
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.headline.bold())
                        .foregroundColor(.primary)
                        .padding(10)
                        .background(
                            Color(uiColor: .secondarySystemBackground)
                                .clipShape(Circle())
                        )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom)
                
                
                HStack {
                    Text(account.name)
                        .font(.title.bold())
                        .matchedGeometryEffect(id: "name\(account.id)", in: animationID)
                    Spacer()
                    if let vip = account.vip {
                        Text("VIP \(vip)")
                            .bold()
                            .foregroundColor(.orange)
                            .frame(width: 60)
                            .padding(5)
                            .background(Color.primary.opacity(0.1))
                            .cornerRadius(5)
                    }
                }
                Divider()
                totalRss
                if showExtra {
                    currentRss
                    bundleRss
                    chestRss
                }
            }
                .padding(.top, 40)
                .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .background(
            Color(uiColor: .systemBackground)
                .matchedGeometryEffect(id: "back\(account.id)", in: animationID)
        )
        .onAppear {
            withAnimation {
                showExtra = true
            }
        }
    }
}

extension AccountView {
    private var totalRss: some View {
        VStack(spacing: 7) {
            Text("Total resources (chests not included)")
                .fontWeight(.semibold)
                .matchedGeometryEffect(id: "totals\(account.id)", in: animationID)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80), spacing: 2),
                ]
            ) {
                ResourceItem(type: .food, value: account.foodValue)
                    .matchedGeometryEffect(id: "food\(account.id)", in: animationID)
                ResourceItem(type: .wood, value: account.woodValue)
                    .matchedGeometryEffect(id: "wood\(account.id)", in: animationID)
                ResourceItem(type: .stone, value: account.stoneValue)
                    .matchedGeometryEffect(id: "stone\(account.id)", in: animationID)
                ResourceItem(type: .gold, value: account.goldValue)
                    .matchedGeometryEffect(id: "gold\(account.id)", in: animationID)
            }
        }
        .padding(.top)
    }
    private var chestRss: some View {
        VStack(spacing: 7) {
            Text("Chests")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80), spacing: 2),
                ]
            ) {
                ResourceItem(type: .food, value: account.foodValue)
                ResourceItem(type: .wood, value: account.woodValue)
                ResourceItem(type: .stone, value: account.stoneValue)
                ResourceItem(type: .gold, value: account.goldValue)
            }
        }
        .rssSubView()
    }
    private var currentRss: some View {
        VStack(spacing: 7) {
            Text("Opened resources")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80), spacing: 2),
                ]
            ) {
                ResourceItem(type: .food, value: account.currentFoodValue)
                ResourceItem(type: .wood, value: account.currentWoodValue)
                ResourceItem(type: .stone, value: account.currentStoneValue)
                ResourceItem(type: .gold, value: account.currentGoldValue)
                ResourceItem(type: .gems, value: account.currentGemsValue)
            }
        }
        .rssSubView()
    }
    private var bundleRss: some View {
        VStack(spacing: 7) {
            Text("Bundles")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80), spacing: 2),
                ]
            ) {
                ResourceItem(type: .food, value: account.foodBundleValue)
                ResourceItem(type: .wood, value: account.woodBundleValue)
                ResourceItem(type: .stone, value: account.stoneBundleValue)
                ResourceItem(type: .gold, value: account.goldBundleValue)
                ResourceItem(type: .gems, value: account.gemsBundleValue)
            }
        }
        .rssSubView()
    }
}

struct AccountView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        
        let kingdom = mainViewModel.kingdoms[0]
        let account = kingdom.accounts[0]
        return AccountView(viewModel: KingdomViewModel(), showAccount: .constant(true), account: account, animationID: namespace)
    }
}

struct ResourcesSubView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(12)
            .transition(
                .asymmetric(
                    insertion: .scale.animation(
                        .spring(response: 0.6, dampingFraction: 0.8).delay(0.3)
                    ),
                    removal: .scale.animation(
                        .spring(response: 0.6, dampingFraction: 0.8)
                    )
                )
            )
    }
}

extension View {
    func rssSubView() -> some View {
        modifier(ResourcesSubView())
    }
}
