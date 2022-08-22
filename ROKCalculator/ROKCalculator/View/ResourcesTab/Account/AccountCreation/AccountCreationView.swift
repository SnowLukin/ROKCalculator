//
//  AccountCreationView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI

struct AccountCreationView: View {
    
    let kingdom: Kingdom
    
    @StateObject private var viewModel = AccountCreationViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismissView
    @State private var text = ""
    @State private var isMain = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").ignoresSafeArea()
                
                VStack {
                    HStack {
                        accountTypeMessage()
                        isMainMenu()
                    }
                    warningMessage()
                    nameInput()
                    createAccountButton()
                    Spacer()
                }.padding()
            }
            .onChange(of: text, perform: { newValue in
                if newValue.count > 15 {
                    text = String(newValue.prefix(15))
                }
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        withAnimation {
                            dismissView()
                        }
                    }
                }
            }
            .navigationTitle("New account")
        }.preferredColorScheme(.dark)
    }
}

struct AccountCreationView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        AccountCreationView(kingdom: kingdom)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension AccountCreationView {
    
    @ViewBuilder
    private func accountTypeMessage() -> some View {
        Text("Account type: ")
        
    }
    
    @ViewBuilder
    private func isMainMenu() -> some View {
        Menu {
            Button("main") {
                withAnimation {
                    isMain = true
                }
            }
            Button("farm") {
                withAnimation {
                    isMain = false
                }
            }
        } label: {
            Text(isMain ? "main" : "farm")
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .background(Color("content3"))
                .cornerRadius(5)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func warningMessage() -> some View {
        Text("Account name can contain 3 to 15 characters.")
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func nameInput() -> some View {
        VStack {
            TextField("Account name", text: $text)
                .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color("content"))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func createAccountButton() -> some View {
        Button {
            withAnimation {
                viewModel.createAccount(
                    text,
                    isMain: isMain,
                    kingdom: kingdom,
                    viewContext: viewContext
                )
                dismissView()
            }
        } label: {
            Text("Create")
                .bold()
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(Color("content"))
                .cornerRadius(12)
        }
        .disabled(!canCreationBeDone())
    }
    
    private func canCreationBeDone() -> Bool {
        if (3...15).contains(text.count) &&
            !kingdom.wrappedAccounts.map({ $0.name }).contains(text) {
            return true
        } else {
            return false
        }
    }
}
