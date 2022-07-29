//
//  RssCalculatorViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 25.07.2022.
//

import SwiftUI

class RssCalculatorViewModel: ObservableObject {
    static let dataManager = PersistenceController.shared
    
    @Published var kingdoms: [Kingdom] = [
        Kingdom(
            name: 1228,
            accounts: [
                Account(
                    name: "Snow", power: 73000000, killPoints: 1800000000, vip: 17,
                    food: Food(one: 27515, two: 480, three: 65, four: 11, five: 12),
                    wood: Wood(one: 27515, two: 480, three: 65, four: 11, five: 12),
                    stone: Stone(one: 27515, two: 480, three: 65, four: 11, five: 12),
                    gold: Gold(one: 27515, two: 480, three: 65, four: 11, five: 12)
                ),
                Account(
                    name: "Typical", type: .farm, power: 90000000, killPoints: 3000000000,
                    food: Food(one: 2715, two: 480, three: 65, four: 11, five: 1),
                    wood: Wood(one: 2715, two: 480, three: 65, four: 11, five: 1),
                    stone: Stone(one: 2715, two: 480, three: 65, four: 11, five: 1),
                    gold: Gold(one: 2715, two: 480, three: 65, four: 11, five: 1)
                ),
                Account(
                    name: "HiPitched", type: .farm, power: 84000000, killPoints: 1700000000,
                    food: Food(one: 27515, two: 480, three: 65, four: 11, five: 122, six: 50),
                    wood: Wood(one: 27515, two: 480, three: 65, four: 11, five: 122, six: 50),
                    stone: Stone(one: 27515, two: 480, three: 65, four: 11, five: 122, six: 50),
                    gold: Gold(one: 27515, two: 480, three: 65, four: 11, five: 122, six: 50)
                ),
                Account(
                    name: "Valk", type: .farm, power: 69000000, killPoints: 1400000000,
                    food: Food(one: 275159, two: 48000, three: 6885, four: 11, five: 12),
                    wood: Wood(one: 275159, two: 48000, three: 6885, four: 11, five: 12),
                    stone: Stone(one: 275159, two: 48000, three: 6885, four: 11, five: 12),
                    gold: Gold(one: 275159, two: 48000, three: 6885, four: 11, five: 12)
                )
            ]
        )
    ]
}
