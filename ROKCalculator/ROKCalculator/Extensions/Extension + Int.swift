//
//  Extension + Int.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 15.08.2022.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
