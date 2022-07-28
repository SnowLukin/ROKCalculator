//
//  Kingdom.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import Foundation

struct Kingdom: Identifiable {
    let id = UUID()
    var name: Int
    var accounts: [Account]
    
    init(name: Int, accounts: [Account] = []) {
        self.name = name
        self.accounts = accounts
    }
}
