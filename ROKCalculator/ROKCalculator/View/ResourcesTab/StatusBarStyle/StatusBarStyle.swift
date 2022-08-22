//
//  StatusBarStyle.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 09.08.2022.
//

import SwiftUI

struct StatusBarStyleModifier: ViewModifier {
    let color: Color
    let material: Material
    @Binding var isHidden: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if !isHidden {
                GeometryReader { proxy in
                    color
                        .background(material)
                        .frame(maxWidth: .infinity)
                        .frame(height: proxy.safeAreaInsets.top)
                        .ignoresSafeArea(.all, edges: .top)
                }
            }
        }
    }
}

extension View {
    func statusBarStyle(color: Color = Color("box"),
                        material: Material = .ultraThinMaterial,
                        hidden: Binding<Bool>) -> some View {
        self.modifier(StatusBarStyleModifier(color: color,
                                             material: material,
                                             isHidden: hidden))
    }
}
