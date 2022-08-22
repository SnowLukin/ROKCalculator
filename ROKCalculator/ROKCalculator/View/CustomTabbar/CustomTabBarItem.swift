//
//  CustomTabBarItem.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 17.08.2022.
//

import SwiftUI

struct CustomTabBarItem: View {
    
    let tag: MainTabItems
    let imageName: String
    
    @Binding var selectedTab: MainTabItems
    @Binding var tabMidPoints: [CGFloat]
    
    var body: some View {
        // For getting midpoint of each item for curve animation
        GeometryReader { reader -> AnyView in
            // Extracting midpoints and storing em
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabMidPoints.count <= 4 {
                    tabMidPoints.append(midX)
                }
            }
            
            return AnyView(button())
        }.frame(height: 50)
    }
}

struct CustomTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color("background").ignoresSafeArea()
            CustomTabbarView(selectedTab: .constant(.resourses))
        }.preferredColorScheme(.dark)
    }
}

extension CustomTabBarItem {
    
    @ViewBuilder
    private func button() -> some View {
        Button {
            withAnimation(
                .interactiveSpring(
                    response: 0.6,
                    dampingFraction: 0.5,
                    blendDuration: 0.5
                )
            ) {
                selectedTab = tag
            }
        } label: {
            buttonLabel()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func buttonLabel() -> some View {
        VStack {
            image()
            text()
        }
        // Lifting when selected
        .offset(y: selectedTab == tag ? -10 : 0)
    }
    
    @ViewBuilder
    private func image() -> some View {
        Image(systemName: imageName)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(
                selectedTab == tag
                ? .white
                : .gray
            )
    }
    
    @ViewBuilder
    private func text() -> some View {
        Text(tag.rawValue)
            .font(.caption)
            .foregroundColor(
                selectedTab == tag
                ? .white
                : .gray
            )
    }
}
