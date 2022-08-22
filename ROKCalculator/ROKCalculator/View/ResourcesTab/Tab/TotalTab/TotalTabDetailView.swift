//
//  TotalTabDetailView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

enum ChartColors: CaseIterable {
    case pink
    case green
    case purple
    case orange
    case blue
    case yellow
    case gray
    case red
    
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
    @ObservedObject var kingdom: Kingdom
    @Binding var currentTab: TabStates
//    @Binding var currentPage: Int
//    @Binding var values: [Double]
    @State private var currentPage = 0
    @State private var values: [Double] = []
    
    var body: some View {
        VStack {
            Text("Details")
                .font(.title3).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    leftArrowButton
                    if currentTab == .total {
                        pageView
                    }
                    rightArrowButton
                }
                if currentTab == .total {
                    PieChartRows(
                        colors: getColors(kingdom.wrappedAccounts.count),
                        names: kingdom.wrappedAccounts.map { $0.name },
                        values: values
                    ).padding(.vertical)
                        .padding(.leading)
                        .background(Color("content"))
                }
            }
            .cornerRadius(12)
            .onAppear {
                withAnimation {
                    switch currentPage {
                    case 0:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.food.getTotal() + Int($0.currentFood))
                        }
                    case 1:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.wood.getTotal() + Int($0.currentWood))
                        }
                    case 2:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.stone.getTotal() + Int($0.currentStone))
                        }
                    default:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.gold.getTotal() + Int($0.currentGold))
                        }
                    }
                }
            }
            .onChange(of: currentPage) { newValue in
                withAnimation {
                    switch newValue {
                    case 0:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.food.getTotal() + Int($0.currentFood))
                        }
                    case 1:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.wood.getTotal() + Int($0.currentWood))
                        }
                    case 2:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.stone.getTotal() + Int($0.currentStone))
                        }
                    default:
                        values = kingdom.wrappedAccounts.map {
                            Double($0.gold.getTotal() + Int($0.currentGold))
                        }
                    }
                }
            }
            .onChange(of: currentTab) { newValue in
                if newValue == .total {
                    withAnimation {
                        switch currentPage {
                        case 0:
                            values = kingdom.wrappedAccounts.map {
                                Double($0.food.getTotal() + Int($0.currentFood))
                            }
                        case 1:
                            values = kingdom.wrappedAccounts.map {
                                Double($0.wood.getTotal() + Int($0.currentWood))
                            }
                        case 2:
                            values = kingdom.wrappedAccounts.map {
                                Double($0.stone.getTotal() + Int($0.currentStone))
                            }
                        default:
                            values = kingdom.wrappedAccounts.map {
                                Double($0.gold.getTotal() + Int($0.currentGold))
                            }
                        }
                    }
                } else {
                    withAnimation {
                        values = []
                        
                    }
                }
            }
        }
        .padding()
        .background(Color("box"))
        .cornerRadius(12)
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
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        return ZStack {
            Color("background").ignoresSafeArea()
            TotalTabDetailView(kingdom: kingdom, currentTab: .constant(.total))
                .padding(.horizontal)
                .environment(\.managedObjectContext, context)
        }
    }
}

extension TotalTabDetailView {
    
    private var pageView: some View {
        TabView(selection: $currentPage) {
            chart(
                rssType: .food,
                values: kingdom.wrappedAccounts.map {
                    Double($0.food.getTotal() + Int($0.currentFood))
                }
            ).tag(0)
            chart(
                rssType: .wood,
                values: kingdom.wrappedAccounts.map {
                    Double($0.wood.getTotal() + Int($0.currentWood))
                }
            ).tag(1)
            chart(
                rssType: .stone,
                values: kingdom.wrappedAccounts.map {
                    Double($0.stone.getTotal() + Int($0.currentStone))
                }
            ).tag(2)
            chart(
                rssType: .gold,
                values: kingdom.wrappedAccounts.map {
                    Double($0.gold.getTotal() + Int($0.currentGold))
                }
            ).tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color("background"))
        .frame(height: 190)
    }
    
    private var leftArrowButton: some View {
        Button {
            withAnimation(.spring()) {
                currentPage -= 1
            }
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
                .font(.title)
                .padding(.leading)
                .opacity(currentPage == 0 ? 0.4 : 1)
                .frame(height: 190)
                .background(Color("background"))
        }.disabled(currentPage == 0)
    }
    
    private var rightArrowButton: some View {
        Button {
            withAnimation(.spring()) {
                currentPage += 1
            }
        } label: {
            Image(systemName: "chevron.right")
                .foregroundColor(.primary)
                .font(.title)
                .padding(.trailing)
                .opacity(currentPage == 3 ? 0.4 : 1)
                .frame(height: 190)
                .background(Color("background"))
        }.disabled(currentPage == 3)
    }
    
    private func chart(rssType: RssType, values: [Double]) -> some View {
        PieChartView(
            rssType: rssType,
            values: values,
            names: kingdom.wrappedAccounts.map { $0.name },
            colors: getColors(kingdom.wrappedAccounts.count),
            backgroundColor: Color("background")
        )
    }
}
