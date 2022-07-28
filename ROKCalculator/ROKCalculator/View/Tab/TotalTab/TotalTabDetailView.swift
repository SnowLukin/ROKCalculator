//
//  TotalTabDetailView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

enum ChartColors: CaseIterable {
    case pink
    case gray
    case red
    case blue
    case green
    case purple
    case orange
    case yellow
    
    var color: Color {
        switch self {
        case .pink:
            return Color.pink
        case .gray:
            return Color.gray
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        }
    }
}

struct TotalTabDetailView: View {
    let kingdom: Kingdom
    
    var body: some View {
        VStack {
            HStack {
                Text("Details")
                    .font(.title3.bold())
                Spacer()
            }
            detailedFood
            detailedWood
            detailedStone
            detailedGold
        }
    }
    
    func getColors(_ amount: Int) -> [Color] {
        var colors: [Color] = []
        var colorIndex = 0
        for index in 0..<amount {
            if index % 8 == 0 && index != 0 {
                colors.append(ChartColors.allCases[colorIndex].color)
                colorIndex = 0
            } else {
                colors.append(ChartColors.allCases[colorIndex].color)
                colorIndex += 1
            }
        }
        return colors
    }
}

struct TotalTabDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        return TotalTabDetailView(kingdom: kingdom)
    }
}

extension TotalTabDetailView {
    private var detailedFood: some View {
        PieChartView(
            rssType: .food,
            values: kingdom.accounts.map { Double($0.food.getTotal()) },
            names: kingdom.accounts.map { $0.name },
            colors: getColors(kingdom.accounts.count)
        )
    }
    
    private var detailedWood: some View {
        PieChartView(
            rssType: .wood,
            values: kingdom.accounts.map { Double($0.wood.getTotal()) },
            names: kingdom.accounts.map { $0.name },
            colors: getColors(kingdom.accounts.count)
        )
    }
    
    private var detailedStone: some View {
        PieChartView(
            rssType: .stone,
            values: kingdom.accounts.map { Double($0.stone.getTotal()) },
            names: kingdom.accounts.map { $0.name },
            colors: getColors(kingdom.accounts.count)
        )
    }
    
    private var detailedGold: some View {
        PieChartView(
            rssType: .gold,
            values: kingdom.accounts.map { Double($0.gold.getTotal()) },
            names: kingdom.accounts.map { $0.name },
            colors: getColors(kingdom.accounts.count)
        )
    }
}
