//
//  CustomNavigationLink.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 16.08.2022.
//

import SwiftUI

struct CustomNavigationLink<Content: View, Destination: View>: View {
    let label: Content
    let destination: Destination
    
    @State private var isActive: Bool = false
    
    init(@ViewBuilder destination: () -> Destination,
         @ViewBuilder label: () -> Content
    ) {
        self.destination = destination()
        self.label = label()
    }
    
    var body: some View {
        ZStack {
            label
                .onTapGesture {
                    withAnimation {
                        isActive.toggle()
                    }
                }
            
            NavigationLink(isActive: $isActive) {
                destination
            } label: {
                EmptyView()
            }.hidden()
        }
    }
}
