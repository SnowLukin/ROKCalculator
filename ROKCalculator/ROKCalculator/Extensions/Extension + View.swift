//
//  Extension + View.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 08.08.2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    func offsetY(complition: @escaping (CGFloat, CGFloat) -> ()) -> some View {
        self
            .modifier(OffsetHelper(onChange: complition))
    }
    
    // MARK: Safe area
    func safeArea() -> UIEdgeInsets {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        guard let safeArea = scene.windows.first?.safeAreaInsets else { return .zero }
        return safeArea
    }
}

struct OffsetHelper: ViewModifier {
    var onChange: (CGFloat, CGFloat) -> ()
    
    @State private var currentOffset: CGFloat = 0
    @State private var previousOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("KingdomViewScroll")).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            previousOffset = currentOffset
                            currentOffset = value
                            onChange(previousOffset, currentOffset)
                        }
                }
            }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct HeaderBoundKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>?
    
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}
