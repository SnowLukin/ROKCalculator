//
//  ResourceItem.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 27.07.2022.
//

import SwiftUI

struct ResourceItem: View {
    let type: RssType
    let value: String
    
    let width: CGFloat
    let fontSize: CGFloat
    let imageSize: CGFloat
    
    // width: 53, fontSize: 12, imageSize: 26
    // width: CGFloat = 60, fontSize: CGFloat = 14,
    // imageSize: CGFloat = 32
    init(
        type: RssType, value: String,
        width: CGFloat = 53, fontSize: CGFloat = 12,
        imageSize: CGFloat = 26
    ) {
        self.type = type
        self.value = value
        self.width = width
        self.imageSize = imageSize
        self.fontSize = fontSize
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Text(value)
                    .font(.system(size: fontSize))
            }
            .frame(width: width)
            .padding(2)
            .padding(.horizontal, 3)
            .background(Color.black.opacity(0.1))
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.white, lineWidth: 1)
                    .opacity(0.1)
            )
            .padding(.leading)
            Image(type.rawValue)
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .aspectRatio(contentMode: .fit)
            
        }
        .foregroundColor(.white)
    }
}

struct ResourceItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            ResourceItem(type: .food, value: "999.9M")
        }
    }
}
