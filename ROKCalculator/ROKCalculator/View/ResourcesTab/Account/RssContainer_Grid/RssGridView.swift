//
//  RssGridView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 03.08.2022.
//

import SwiftUI

enum FocusRssValue {
    case keyboardFocus
    case hiddenFocus
}

struct RssGridView: View {
    
    @ObservedObject var account: Account
    let tag: TagType
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel: AccountViewModel
    @FocusState private var keyboardFocus: FocusRssValue?
    
    @State private var text = ""
    @State private var hiddenText = ""
    @State private var currentSelection: TextfieldSelection?
    
    var body: some View {
        ZStack {
            // Hidden text for calling keyboard to appear
            hiddenTextField()
            if tag == .all {
                allView()
            } else {
                rssGrid(tag: tag)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    toolbarButton(imageName: "xmark")
                    keyboardTextfield()
                    toolbarButton(imageName: "checkmark") {
                        if let currentSelection = currentSelection,
                           let textValue = Int(text) {
                            viewModel.setValue(
                                textValue,
                                selection: currentSelection,
                                account: account,
                                viewContext: viewContext
                            )
                        } else {
                            print("Failed saving new value.")
                        }
                    }
                }
            }
        }
    }
}

struct RssGridView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[2]
        return RssGridView(account: account, tag: .chests)
            .environmentObject(AccountViewModel())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension RssGridView {
    @ViewBuilder
    private func keyboardTextfield() -> some View {
        ZStack {
            TextField("Input your value", text: $text)
                .font(.caption.bold())
                .keyboardType(.numberPad)
                .focused($keyboardFocus, equals: .keyboardFocus)
                .padding(.horizontal, 5)
        }.padding(7)
            .background(Color("box"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.white, lineWidth: 1)
            )
    }
    
    @ViewBuilder
    private func toolbarButton(imageName: String, action: @escaping () -> Void = {}) -> some View {
        Button {
            action()
            // Calling twice to fix returning
            // first responder to hidden textfield
            keyboardFocus = nil
            keyboardFocus = nil
        } label: {
            Image(systemName: imageName)
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    private func hiddenTextField() -> some View {
        ZStack {
            TextField("", text: $hiddenText)
                .keyboardType(.numberPad)
                .focused($keyboardFocus, equals: .hiddenFocus)
                .opacity(0)
        }.frame(width: 1, height: 1)
    }
    
    @ViewBuilder
    private func allView() -> some View {
        VStack {
            DisclosureGroup("Current resources") {
                rssGrid(tag: .current)
                    .padding(.vertical)
            }
            DisclosureGroup("Food") {
                rssGrid(tag: .food)
                    .padding(.vertical)
            }
            DisclosureGroup("Wood") {
                rssGrid(tag: .wood)
                    .padding(.vertical)
            }
            DisclosureGroup("Stone") {
                rssGrid(tag: .stone)
                    .padding(.vertical)
            }
            DisclosureGroup("Gold") {
                rssGrid(tag: .gold)
                    .padding(.vertical)
            }
            DisclosureGroup("Gems") {
                rssGrid(tag: .gems)
                    .padding(.vertical)
            }
            DisclosureGroup("Pick one Chests") {
                rssGrid(tag: .chests)
                    .padding(.vertical)
            }
        }
    }
    
    @ViewBuilder
    private func rssGrid(tag: TagType) -> some View {
        if tag == .current {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(getSelection(tag: tag), id: \.self) { selection in
                    CurrentRssContainerView(account: account, selection: selection)
                        .onTapGesture {
                            currentSelection = selection
                            text = String(viewModel.getValue(selection, account: account))
                            keyboardFocus = .hiddenFocus
                            keyboardFocus = .keyboardFocus
                        }
                }
            }
        } else {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(getSelection(tag: tag), id: \.self) { selection in
                    RssContainerView(account: account, selection: selection)
                        .onTapGesture {
                            currentSelection = selection
                            text = String(viewModel.getValue(selection, account: account))
                            keyboardFocus = .hiddenFocus
                            keyboardFocus = .keyboardFocus
                        }
                }
            }
        }
    }
    
    private func getSelection(tag: TagType) -> [TextfieldSelection] {
        switch tag {
        case .food:
            return [.foodOne, .foodTwo, .foodThree, .foodFour, .foodFive, .foodSix, .foodSeven]
        case .wood:
            return [.woodOne, .woodTwo, .woodThree, .woodFour, .woodFive, .woodSix, .woodSeven]
        case .stone:
            return [.stoneOne, .stoneTwo, .stoneThree,.stoneFour, .stoneFive, .stoneSix, .stoneSeven]
        case .gold:
            return [.goldOne, .goldTwo, .goldThree, .goldFour, .goldFive, .goldSix, .goldSeven]
        case .gems:
            return [.gemOne, .gemTwo, .gemThree, .gemFour, .gemFive, .gemSix, .gemSeven, .gemEight, .gemNine]
        case .chests:
            return [.chestOne, .chestTwo, .chestThree, .chestFour]
        case .current:
            return [.currentFood, .currentWood, .currentStone, .currentGold, .currentGems]
        case .all:
            return TextfieldSelection.allCases
        }
    }
}
