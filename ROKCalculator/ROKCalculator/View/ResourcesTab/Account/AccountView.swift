//
//  AccountView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 27.07.2022.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var account: Account
    
    @StateObject private var accountViewModel = AccountViewModel()
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Divider()
                    totalRss
                    Divider()
                    Text("Choose sections below to edit data")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                    currentRss
                    bundleRss
                    chestRss
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Rename")
                        } icon: {
                            Image(systemName: "pencil")
                        }
                    }
                    Button(role: .destructive) {
                        
                    } label: {
                        Label {
                            Text("Delete")
                        } icon: {
                            Image(systemName: "trash")
                        }
                    }
                } label: {
                    Text("Edit")
                }
            }
        }
        .navigationBarHidden(false)
        .navigationTitle(account.name)
        .environmentObject(accountViewModel)
    }
}

extension AccountView {
    private var totalRss: some View {
        VStack {
            Text("Total resources")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .font(.caption)
                    Text("Chests are not included")
                        .font(.caption)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ], spacing: 0
                ) {
                    ResourceItem(type: .food, value: account.foodValue)
                    ResourceItem(type: .wood, value: account.woodValue)
                    ResourceItem(type: .stone, value: account.stoneValue)
                    ResourceItem(type: .gold, value: account.goldValue)
                    ResourceItem(type: .gems, value: account.gemsValue)
                }
            }.padding()
                .background(Color("content"))
                .cornerRadius(7)
        }
        .padding()
        .background(Color("box"))
        .cornerRadius(12)
    }
    
    private var chestRss: some View {
        NavigationLink {
            ResourcesDataView(account: account, tag: .chests)
                .environmentObject(accountViewModel)
        } label: {
            VStack {
                Text("Pick One Chests")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ], spacing: 0
                ) {
                    ResourceItem(type: .food, value: account.totalChestValue(of: .food))
                    ResourceItem(type: .wood, value: account.totalChestValue(of: .wood))
                    ResourceItem(type: .stone, value: account.totalChestValue(of: .stone))
                    ResourceItem(type: .gold, value: account.totalChestValue(of: .gold))
                }.padding(.horizontal, 9)
                    .background(Color("content"))
            }
            .rssSubView()
        }
    }
    
    private var currentRss: some View {
        NavigationLink {
            ResourcesDataView(account: account, tag: .current)
                .environmentObject(accountViewModel)
        } label: {
            VStack {
                Text("Opened resources")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ], spacing: 0
                ) {
                    ResourceItem(type: .food, value: account.currentFoodValue)
                    ResourceItem(type: .wood, value: account.currentWoodValue)
                    ResourceItem(type: .stone, value: account.currentStoneValue)
                    ResourceItem(type: .gold, value: account.currentGoldValue)
                    ResourceItem(type: .gems, value: account.currentGemsValue)
                }.padding(.horizontal, 9)
                .background(Color("content"))
            }
            .rssSubView()
        }
    }
    
    private var bundleRss: some View {
        NavigationLink {
            ResourcesDataView(account: account, tag: .food)
                .environmentObject(accountViewModel)
        } label: {
            VStack {
                Text("Bundles")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ], spacing: 0
                ) {
                    ResourceItem(type: .food, value: account.foodBundleValue)
                    ResourceItem(type: .wood, value: account.woodBundleValue)
                    ResourceItem(type: .stone, value: account.stoneBundleValue)
                    ResourceItem(type: .gold, value: account.goldBundleValue)
                    ResourceItem(type: .gems, value: account.gemsBundleValue)
                }
                .padding(.horizontal, 9)
                .background(Color("content"))
            }.rssSubView()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[0]
        return NavigationView {
            AccountView(account: account)
        }
        .environment(\.managedObjectContext, context)
        
    }
}

struct ResourcesSubView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical)
            .background(Color("box"))
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
