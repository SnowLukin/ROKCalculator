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
            ScrollView {
                ForEach(kingdoms, id: \.self) { kingdom in
                    KingdomCellView(kingdom: kingdom)
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectedKingdom = kingdom
                                dismissView()
                            }
                        }
                }.searchable(text: $searchText)
                    .padding(.top)
            }
            .background(Color("background"))
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
