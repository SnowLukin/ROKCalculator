//
//  KingdomCellView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI

struct KingdomCellView: View {
    
    let kingdom: Kingdom
    @ObservedObject var kingdomViewModel: KingdomViewModel
    
    @StateObject private var viewModel = KingdomCellViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        customCell()
    }
}

struct KingdomCellView_Previews: PreviewProvider {
    static var previews: some View {
        KingdomsListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(KingdomViewModel())
    }
}

extension KingdomCellView {
    @ViewBuilder
    private func customCell() -> some View {
        VStack {
            cellHeader()
            Divider()
            itemsGrid()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color("box"))
        .cornerRadius(12)
        .overlay(alignment: .topTrailing) {
            Button {
                if kingdomViewModel.selectedKingdom?.name == kingdom.name {
                    kingdomViewModel.selectedKingdom = nil
                }
                withAnimation {
                    viewModel.deleteKingdom(kingdom, viewContext: viewContext)
                }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding(.trailing)
            .padding(.top, 10)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cellHeader() -> some View {
        VStack(alignment: .leading) {
            Text("# \(String(kingdom.name))")
                .font(.title3).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(kingdom.wrappedAccounts.count) accounts")
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func itemsGrid() -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 4)], spacing: 0) {
            ResourceItem(type: .food, value: kingdom.totalResources(of: .food))
            ResourceItem(type: .wood, value: kingdom.totalResources(of: .wood))
            ResourceItem(type: .stone, value: kingdom.totalResources(of: .stone))
            ResourceItem(type: .gold, value: kingdom.totalResources(of: .gold))
        }.padding(.horizontal)
            .background(Color("content"))
    }
}
