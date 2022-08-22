//
//  AccountRowView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI


struct AccountRowView: View {
    
    @ObservedObject var account: Account
    
    @StateObject private var viewModel = AccountRowViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) private var colorSheme
    
    @State private var openDetails = false
    @State private var isExpanded = true
    
    var body: some View {
        VStack(alignment: .leading) {
            accountCell
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            Divider()
                .padding(.horizontal)
            itemsGrid(account: account)
        }
        .padding(.vertical)
        .background(
            Color("box")
        )
        .cornerRadius(12)
        .overlay(alignment: .topTrailing) {
            Button {
                withAnimation {
                    viewModel.deleteAccount(account, viewContext: viewContext)
                }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(Color.red)
            }.padding(.trailing)
                .padding(.top, 10)
        }
    }
}

extension AccountRowView {
    
    private var accountCell: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(account.name)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                Text(account.isMain ? "main" : "farm")
                    .font(.callout)
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(3)
                    .background(Color("content3"))
                    .cornerRadius(5)
            }
        }
    }
    
    private func itemsGrid(account: Account) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
            ResourceItem(type: .food, value: account.foodValue)
            ResourceItem(type: .wood, value: account.woodValue)
            ResourceItem(type: .stone, value: account.stoneValue)
            ResourceItem(type: .gold, value: account.goldValue)
            ResourceItem(type: .gems, value: account.gemsValue)
        }
        .padding(.horizontal, 7)
        .background(Color("content"))
        .frame(maxWidth: .infinity)
    }
}

struct AccountRowView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[0]
        return ZStack {
            Color("background").ignoresSafeArea()
            AccountRowView(account: account)
                .padding(.horizontal)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.managedObjectContext, context)
        }
    }
}
