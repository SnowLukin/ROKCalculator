//
//  AccountView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 27.07.2022.
//

import SwiftUI

struct AccountView: View {
    
    let account: Account
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(account.name)
                    .font(.title)
                    .fontWeight(.semibold)
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
            if let power = account.power {
                Text("Power: \(power)")
            }
            if let killPoints = account.killPoints {
                Text("Kill Points: \(killPoints)")
            }
            Divider()
            totalRss
            chestRss
            Spacer()
        }.padding(.top, 40)
            .padding(.horizontal)
    }
}

extension AccountView {
    private var totalRss: some View {
        VStack(spacing: 7) {
            HStack {
                Text("Total resources (chests not included)")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.primary)
                        .font(.title3)
                }
            }
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
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(20)
        .padding(.top)
    }
    private var chestRss: some View {
        VStack(spacing: 7) {
            HStack {
                Text("Chests")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.primary)
                        .font(.title3)
                }
            }
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
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
        .cornerRadius(20)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        let account = kingdom.accounts[0]
        return AccountView(account: account)
    }
}
