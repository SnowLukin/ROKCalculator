//
//  TotalTabPreviewView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct TotalTabPreviewView: View {
    
    let kingdom: Kingdom
    
    var body: some View {
        VStack {
            HStack {
                Text("Total resources (chests not included)")
                    .font(.title3.bold())
                Spacer()
            }
            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 80), spacing: 2),
                ]
            ) {
                foodItem
                woodItem
                stoneItem
                goldItem
            }
            .padding(.bottom)
            
            Text("Total chests' resources")
                .font(.title3.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 5) {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                    Text("Represents only one resource type")
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 80), spacing: 2),
                    ]
                ) {
                    foodItem
                    woodItem
                    stoneItem
                    goldItem
                }
            }.padding()
            .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(12)
        }
    }
}

extension TotalTabPreviewView {
    
    private var foodItem: some View {
        rssItem(
            .food,
            value:
                getFormattedValue(
                    kingdom.accounts.map {
                        Double($0.food.getTotal())
                    }.reduce(0, +)
                )
        )
    }
    
    private var woodItem: some View {
        rssItem(
            .wood,
            value:
                getFormattedValue(
                    kingdom.accounts.map {
                        Double($0.wood.getTotal())
                    }.reduce(0, +)
                )
        )
    }
    
    private var stoneItem: some View {
        rssItem(
            .stone,
            value:
                getFormattedValue(
                    kingdom.accounts.map {
                        Double($0.stone.getTotal())
                    }.reduce(0, +)
                )
        )
    }
    
    private var goldItem: some View {
        rssItem(
            .gold,
            value:
                getFormattedValue(
                    kingdom.accounts.map {
                        Double($0.gold.getTotal())
                    }.reduce(0, +)
                )
        )
    }
    
    private func rssItem(_ type: RssType, value: String) -> some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(value)
                    .font(.system(size: 14))
            }
            .frame(width: 60)
            .padding(2)
            .padding(.horizontal, 3)
            .background(Color.primary.opacity(0.1))
            .cornerRadius(5)
            .padding(.leading)
            Image(type.rawValue)
                .resizable()
                .frame(width: 32, height: 32)
                .aspectRatio(contentMode: .fit)
            
        }
        .foregroundColor(.primary)
    }
    
    private func getFormattedValue(_ value: Double) -> String {
        if value >= 1000000000 {
            let newValue = Double(value) / 1000000000
            return "\(String(format: "%.1f", newValue))B"
        } else if value >= 1000000 {
            let newValue = Double(value) / 1000000
            return "\(String(format: "%.1f", newValue))M"
        } else {
            let newValue = Double(value) / 1000
            return "\(String(format: "%.0f", newValue))K"
        }
    }
}

struct TotalTabPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        TotalTabPreviewView(kingdom: kingdom)
    }
}
