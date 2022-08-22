//
//  ContentView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var resourcesViewModel = KingdomViewModel()
    @State private var selectedTab: MainTabItems = .resourses
    @State private var showAccountCreationView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").ignoresSafeArea()
                currentTab()
                VStack {
                    Spacer()
                    CustomTabbarView(selectedTab: $selectedTab)
                }.ignoresSafeArea()
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension ContentView {
    @ViewBuilder
    private func currentTab() -> some View {
        Group {
            switch selectedTab {
            case .resourses:
                ResourcesTabView(
                    viewModel: resourcesViewModel,
                    showAccountCreationView: $showAccountCreationView
                ).navigationBarHidden(true)
            case .equipment:
                Text("Equipment")
            case .commanders:
                Text("Commanders")
            case .mails:
                Text("Mails")
            }
        }
    }
    
    @ViewBuilder
    private func addAccountButton() -> some View {
        if resourcesViewModel.currentTab == .accounts {
            Button {
                withAnimation {
                    showAccountCreationView.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 45, height: 45)
                    .background(
                        Circle().fill(Color("box"))
                    )
                    .overlay(
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 2)
                    )
            }.padding(55)
        }
    }
}
