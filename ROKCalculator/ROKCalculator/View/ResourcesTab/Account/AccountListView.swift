//
//  AccountListView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI

struct AccountListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var kingdom: Kingdom
    
    var body: some View {
        VStack {
            ForEach(kingdom.wrappedAccounts) { account in
                CustomNavigationLink {
                    AccountView(account: account)
                } label: {
                    AccountRowView(account: account)
                }.padding(.horizontal)
            }
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        return ScrollView {
            AccountListView(kingdom: kingdom)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }.background(Color("background"))
    }
}
