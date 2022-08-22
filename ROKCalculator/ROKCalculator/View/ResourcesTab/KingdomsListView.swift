//
//  KingdomsListView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 12.08.2022.
//

import SwiftUI

struct KingdomsListView: View {
    @EnvironmentObject private var viewModel: KingdomViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismissView
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Kingdom.name, ascending: true)
        ],
        animation: .default)
    private var kingdoms: FetchedResults<Kingdom>
    
    @State private var searchText = ""
    @State private var showSheet = false
    
    var filteredKingdoms: [Kingdom] {
        if searchText.isEmpty {
            return kingdoms.map { $0 }
        } else {
            return kingdoms.filter { String($0.name).contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").ignoresSafeArea()
                if kingdoms.isEmpty {
                    noKingdomsMessage()
                } else {
                    kingdomsList()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        withAnimation {
                            dismissView()
                        }
                    }
                }
            }
            .overlay(alignment: .bottom) {
                addKingdomButton()
            }
            .navigationTitle("Kingdoms")
            .sheet(isPresented: $showSheet) {
                KingdomCreationView(kingdoms: kingdoms.map { $0 })
            }
        }
    }
}

struct KingdomsListView_Previews: PreviewProvider {
    static var previews: some View {
        KingdomsListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(KingdomViewModel())
    }
}

extension KingdomsListView {
    
    @ViewBuilder
    private func kingdomsList() -> some View {
        ScrollView {
            ForEach(kingdoms, id: \.self) { kingdom in
                KingdomCellView(kingdom: kingdom, kingdomViewModel: viewModel)
                    .onTapGesture {
                        withAnimation {
                            viewModel.selectedKingdom = kingdom
                            dismissView()
                        }
                    }
            }.searchable(text: $searchText)
                .padding(.top)
        }
    }
    
    @ViewBuilder
    private func noKingdomsMessage() -> some View {
        VStack(spacing: 10) {
            Text("To add a kingdom")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text("press a plus button below")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
    }
    
    @ViewBuilder
    private func addKingdomButton() -> some View {
        Button {
            withAnimation {
                showSheet.toggle()
            }
        } label: {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.gray)
                .background(
                    Circle()
                        .fill(Color("box"))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2)
                        )
                )
                .padding(.bottom)
        }
    }
}
