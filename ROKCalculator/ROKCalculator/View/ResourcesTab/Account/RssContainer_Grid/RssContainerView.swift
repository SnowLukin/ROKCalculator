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
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack {
            Image(selection.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
            textValue()
        }.frame(width: 70, height: 70)
            .onChange(of: account) { _ in
                print("Something change imageCiwq")
            }
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
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

extension RssContainerView {
    @ViewBuilder
    private func textValue() -> some View {
        VStack {
            Spacer()
            textView()
        }
    }
}


extension RssContainerView {
    @ViewBuilder
    private func textView() -> some View {
        switch selection {
        case .foodOne:
            FoodContainerView(food: account.food, selection: .one)
        case .foodTwo:
            FoodContainerView(food: account.food, selection: .two)
        case .foodThree:
            FoodContainerView(food: account.food, selection: .three)
        case .foodFour:
            FoodContainerView(food: account.food, selection: .four)
        case .foodFive:
            FoodContainerView(food: account.food, selection: .five)
        case .foodSix:
            FoodContainerView(food: account.food, selection: .six)
        case .foodSeven:
            FoodContainerView(food: account.food, selection: .seven)
        case .woodOne:
            WoodContainerView(wood: account.wood, selection: .one)
        case .woodTwo:
            WoodContainerView(wood: account.wood, selection: .two)
        case .woodThree:
            WoodContainerView(wood: account.wood, selection: .three)
        case .woodFour:
            WoodContainerView(wood: account.wood, selection: .four)
        case .woodFive:
            WoodContainerView(wood: account.wood, selection: .five)
        case .woodSix:
            WoodContainerView(wood: account.wood, selection: .six)
        case .woodSeven:
            WoodContainerView(wood: account.wood, selection: .seven)
        case .stoneOne:
            StoneContainerView(stone: account.stone, selection: .one)
        case .stoneTwo:
            StoneContainerView(stone: account.stone, selection: .two)
        case .stoneThree:
            StoneContainerView(stone: account.stone, selection: .three)
        case .stoneFour:
            StoneContainerView(stone: account.stone, selection: .four)
        case .stoneFive:
            StoneContainerView(stone: account.stone, selection: .five)
        case .stoneSix:
            StoneContainerView(stone: account.stone, selection: .six)
        case .stoneSeven:
            StoneContainerView(stone: account.stone, selection: .seven)
        case .goldOne:
            GoldContainerView(gold: account.gold, selection: .one)
        case .goldTwo:
            GoldContainerView(gold: account.gold, selection: .two)
        case .goldThree:
            GoldContainerView(gold: account.gold, selection: .three)
        case .goldFour:
            GoldContainerView(gold: account.gold, selection: .four)
        case .goldFive:
            GoldContainerView(gold: account.gold, selection: .five)
        case .goldSix:
            GoldContainerView(gold: account.gold, selection: .six)
        case .goldSeven:
            GoldContainerView(gold: account.gold, selection: .seven)
        case .gemOne:
            FoodContainerView(food: account.food, selection: .one)
        case .gemTwo:
            GemsContainerView(gems: account.gems, selection: .two)
        case .gemThree:
            GemsContainerView(gems: account.gems, selection: .three)
        case .gemFour:
            GemsContainerView(gems: account.gems, selection: .four)
        case .gemFive:
            GemsContainerView(gems: account.gems, selection: .five)
        case .gemSix:
            GemsContainerView(gems: account.gems, selection: .six)
        case .gemSeven:
            GemsContainerView(gems: account.gems, selection: .seven)
        case .gemEight:
            GemsContainerView(gems: account.gems, selection: .eight)
        case .gemNine:
            GemsContainerView(gems: account.gems, selection: .nine)
        case .chestOne:
            PickOneChestContainerView(chest: account.pickChests, selection: .one)
        case .chestTwo:
            PickOneChestContainerView(chest: account.pickChests, selection: .two)
        case .chestThree:
            PickOneChestContainerView(chest: account.pickChests, selection: .three)
        default:
            PickOneChestContainerView(chest: account.pickChests, selection: .four)
        }
    }
}


struct RssContainer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2.bold())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 4)
            .background(
                Color.black.opacity(0.5)
            ).cornerRadius(4)
            .padding(.bottom, 4)
            .padding(.horizontal, 4)
    }
}
extension View {
    func rssContainer() -> some View {
        self.modifier(RssContainer())
    }
}


struct FoodContainerView: View {
    @ObservedObject var food: Food
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(food.one).withCommas()
        case .two:
            return Int(food.two).withCommas()
        case .three:
            return Int(food.three).withCommas()
        case .four:
            return Int(food.four).withCommas()
        case .five:
            return Int(food.five).withCommas()
        case .six:
            return Int(food.six).withCommas()
        default:
            return Int(food.seven).withCommas()
        }
    }
}

struct WoodContainerView: View {
    @ObservedObject var wood: Wood
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(wood.one).withCommas()
        case .two:
            return Int(wood.two).withCommas()
        case .three:
            return Int(wood.three).withCommas()
        case .four:
            return Int(wood.four).withCommas()
        case .five:
            return Int(wood.five).withCommas()
        case .six:
            return Int(wood.six).withCommas()
        default:
            return Int(wood.seven).withCommas()
        }
    }
}

struct StoneContainerView: View {
    @ObservedObject var stone: Stone
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(stone.one).withCommas()
        case .two:
            return Int(stone.two).withCommas()
        case .three:
            return Int(stone.three).withCommas()
        case .four:
            return Int(stone.four).withCommas()
        case .five:
            return Int(stone.five).withCommas()
        case .six:
            return Int(stone.six).withCommas()
        default:
            return Int(stone.seven).withCommas()
        }
    }
}

struct GoldContainerView: View {
    @ObservedObject var gold: Gold
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(gold.one).withCommas()
        case .two:
            return Int(gold.two).withCommas()
        case .three:
            return Int(gold.three).withCommas()
        case .four:
            return Int(gold.four).withCommas()
        case .five:
            return Int(gold.five).withCommas()
        case .six:
            return Int(gold.six).withCommas()
        default:
            return Int(gold.seven).withCommas()
        }
    }
}

struct GemsContainerView: View {
    @ObservedObject var gems: Gems
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(gems.one).withCommas()
        case .two:
            return Int(gems.two).withCommas()
        case .three:
            return Int(gems.three).withCommas()
        case .four:
            return Int(gems.four).withCommas()
        case .five:
            return Int(gems.five).withCommas()
        case .six:
            return Int(gems.six).withCommas()
        case .seven:
            return Int(gems.seven).withCommas()
        case .eight:
            return Int(gems.eight).withCommas()
        case .nine:
            return Int(gems.nine).withCommas()
        }
    }
}

struct PickOneChestContainerView: View {
    @ObservedObject var chest: PickOneChest
    let selection: RssLvl
    
    var body: some View {
        Text(getValue())
            .rssContainer()
    }
    
    private func getValue() -> String {
        switch selection {
        case .one:
            return Int(chest.one).withCommas()
        case .two:
            return Int(chest.two).withCommas()
        case .three:
            return Int(chest.three).withCommas()
        default:
            return Int(chest.four).withCommas()
        }
    }
}
