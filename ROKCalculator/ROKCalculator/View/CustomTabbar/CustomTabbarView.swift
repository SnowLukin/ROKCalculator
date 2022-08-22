//
//  CustomTabbarView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 17.08.2022.
//

import SwiftUI

enum MainTabItems: String {
    case resourses = "Resources"
    case equipment = "Equipment"
    case commanders = "Sculpures"
    case mails = "Mail Editor"
}

struct CustomTabbarView: View {
    
    @Binding var selectedTab: MainTabItems
    @State private var tabMidPoints: [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0) {
            CustomTabBarItem(
                tag: .resourses,
                imageName: "house",
                selectedTab: $selectedTab,
                tabMidPoints: $tabMidPoints
            )
            CustomTabBarItem(
                tag: .equipment,
                imageName: "house",
                selectedTab: $selectedTab,
                tabMidPoints: $tabMidPoints
            )
            CustomTabBarItem(
                tag: .commanders,
                imageName: "house",
                selectedTab: $selectedTab,
                tabMidPoints: $tabMidPoints
            )
            CustomTabBarItem(
                tag: .mails,
                imageName: "house",
                selectedTab: $selectedTab,
                tabMidPoints: $tabMidPoints
            )
        }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color.white, lineWidth: 1)
                    .clipShape(TabCurveShape(tabPoint: getCurvePoint() - 15))
            )
            .background(
                Color("box")
                    .clipShape(TabCurveShape(tabPoint: getCurvePoint() - 15))
            )
            .overlay(alignment: .bottomLeading) {
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
                    .offset(x: getCurvePoint() - 20)
            }
            .cornerRadius(30)
            .padding(.horizontal)
    }
}

struct CustomTabbarView_Previews: PreviewProvider {
    @State static var selectedTab: MainTabItems = .resourses
    
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color("background").ignoresSafeArea()
            CustomTabbarView(selectedTab: $selectedTab)
        }.preferredColorScheme(.dark)
    }
}

extension CustomTabbarView {
    private func getCurvePoint() -> CGFloat {
        if tabMidPoints.isEmpty {
            return 10
        }
        switch selectedTab {
        case .resourses:
            return tabMidPoints[0]
        case .equipment:
            return tabMidPoints[1]
        case .commanders:
            return tabMidPoints[2]
        case .mails:
            return tabMidPoints[3]
        }
    }
}
