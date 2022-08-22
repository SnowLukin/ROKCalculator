//
//  RssContainerView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//

import SwiftUI

struct RssContainerView: View {
    
    @ObservedObject var account: Account
    let selection: TextfieldSelection
    
    @EnvironmentObject private var viewModel: AccountViewModel
    
    var body: some View {
        ZStack {
            Image(selection.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
            textValue()
        }.frame(width: 70, height: 70)
    }
}

struct RssContainerView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[2]
        return ZStack {
            Color("background").ignoresSafeArea()
            RssContainerView(account: account, selection: .foodOne)
                .environmentObject(AccountViewModel())
        }
    }
}

extension RssContainerView {
    @ViewBuilder
    private func textValue() -> some View {
        VStack {
            Spacer()
            Text(
                viewModel.getValue(
                    selection,
                    account: account
                ).withCommas()
            )
            .font(.caption2.bold())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 4)
            .background(
                Color.black.opacity(0.5)
                    .cornerRadius(4)
            )
            .padding(.bottom, 4)
            .padding(.horizontal, 4)
        }
    }
}
