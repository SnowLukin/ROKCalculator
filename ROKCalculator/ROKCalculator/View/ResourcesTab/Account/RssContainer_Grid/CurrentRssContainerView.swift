//
//  CurrentRssContainerView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 15.08.2022.
//

import SwiftUI

struct CurrentRssContainerView: View {
    
    @ObservedObject var account: Account
    let selection: TextfieldSelection
    
    @EnvironmentObject private var viewModel: AccountViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @State private var text = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(viewModel.getValue(selection, account: account).withCommas())
                .font(.caption.bold())
                .foregroundColor(.white)
                .padding(.horizontal, 5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(height: 25)
                .background(
                    Color("box")
                )
                .cornerRadius(7)
                .padding(.leading, 15)
            Image(selection.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            
        }
    }
}

struct CurrentRssContainerView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[2]
        CurrentRssContainerView(account: account, selection: .currentFood)
            .environmentObject(AccountViewModel())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
