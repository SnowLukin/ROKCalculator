//
//  KingdomViewModel.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 11.08.2022.
//

import SwiftUI

class KingdomViewModel: ObservableObject {
    @Published var selectedKingdom: Kingdom?
    @Published var currentTab: TabStates = .total
    @Published var tabAnimationID: Int = 0
    @Published var selectedAccount: Account?
    @Published var showAccount = false
}
