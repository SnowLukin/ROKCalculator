//
//  AccountRowView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct AccountRowView: View {
    let account: Account
    var animationID: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(account.name)
                        .font(.title3.bold())
                        .matchedGeometryEffect(id: "name\(account.id)", in: animationID)
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
        }
        .padding(16)
        .background(
            Color(UIColor.secondarySystemBackground)
                .matchedGeometryEffect(id: "back\(account.id)", in: animationID)
        )
        .cornerRadius(22)
    }
}

extension AccountRowView {
    private var totalRss: some View {
        VStack(alignment: .leading) {
            Text("Total resources (chests not included)")
                .fontWeight(.semibold)
                .matchedGeometryEffect(id: "totals\(account.id)", in: animationID)
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
    }
}

struct AccountRowView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        let account = kingdom.accounts[3]
        return AccountRowView(account: account, animationID: namespace)
    }
}
