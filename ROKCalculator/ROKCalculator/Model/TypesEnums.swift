//
//  TypesEnums.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import Foundation

enum RssType: String, CaseIterable {
    case food = "foodItem"
    case wood = "woodItem"
    case stone = "stoneItem"
    case gold = "goldItem"
    case gems = "gemItem"
}

enum RssLvl: String, CaseIterable {
    case one = "one"
    case two = "two"
    case three = "three"
    case four = "four"
    case five = "five"
    case six = "six"
    case seven = "seven"
    case eight = "eight"
    case nine = "nine"
}

enum MaterialType {
    case normal
    case advanced
    case epic
    case legendary
}
