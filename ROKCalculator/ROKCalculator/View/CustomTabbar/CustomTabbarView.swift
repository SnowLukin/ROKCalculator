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
        }.padding(15)
            .padding(.bottom)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.black, lineWidth: 1)
            )
            .background(
                Color("box")
            )
            .cornerRadius(15)
    }
}

struct CustomTabbarView_Previews: PreviewProvider {
    @State static var selectedTab: MainTabItems = .resourses
    
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color("background").ignoresSafeArea()
            VStack {
                Spacer()
                CustomTabbarView(selectedTab: $selectedTab)
            }.ignoresSafeArea()
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
