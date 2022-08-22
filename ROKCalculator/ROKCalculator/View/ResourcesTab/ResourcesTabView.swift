//
//  ResourcesTabView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 17.08.2022.
//

import SwiftUI
import CoreData

struct ResourcesTabView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: KingdomViewModel
    
    @Binding var showAccountCreationView: Bool
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Kingdom.name, ascending: true)
        ],
        animation: .default
    )
    private var kingdoms: FetchedResults<Kingdom>
    
    @State private var showKingdomsList = false
    
    var body: some View {
        Group {
            if let kingdom = viewModel.selectedKingdom {
                KingdomView(
                    kingdom: kingdom,
                    showKingdomsList: $showKingdomsList,
                    showAccountCreationView: $showAccountCreationView
                ).environmentObject(viewModel)
            } else {
                ZStack {
                    Color("background").ignoresSafeArea()
                    VStack(spacing: 10) {
                        Text("No kingdom selected")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Button {
                            withAnimation {
                                showKingdomsList.toggle()
                            }
                        } label: {
                            Text("Select kingdom")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showKingdomsList) {
            KingdomsListView()
                .environmentObject(viewModel)
        }
    }
}

struct ResourcesTabView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesTabView(viewModel: KingdomViewModel(), showAccountCreationView: .constant(false))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
