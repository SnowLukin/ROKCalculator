//
//  AccountRowView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

enum RssType: String, CaseIterable {
    case food = "foodItem"
    case wood = "woodItem"
    case stone = "stoneItem"
    case gold = "goldItem"
}

struct AccountRowView: View {
    
    let account: Account
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(account.name)
                        .font(.title3.bold())
                    Spacer()
                    Text(account.type == .main ? "main" : "farm")
                        .bold()
                        .foregroundColor(.white)
                        .padding(5)
                        .background(
                            account.type == .main
                            ? Color.red
                            : Color.green
                        )
                        .cornerRadius(5)
                }
            }
            Divider()
            totalRss
//            Divider()
//            chestRss
//            Spacer()
        }
        .padding(16)
        .background(
            Color(UIColor.secondarySystemBackground)
        )
        .cornerRadius(22)
    }
}

extension AccountRowView {
    private var totalRss: some View {
        VStack(alignment: .leading) {
            Text("Total resources (chests not included)")
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
    }
    
    private var chestRss: some View {
        VStack(alignment: .leading) {
            Text("Chests")
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
    }
}

struct AccountRowView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        let account = kingdom.accounts[3]
        return AccountRowView(account: account)
    }
}
