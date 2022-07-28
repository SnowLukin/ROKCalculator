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
    
    var body: some View {
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
}

struct ResourceItem_Previews: PreviewProvider {
    static var previews: some View {
        ResourceItem(type: .food, value: "999.9M")
    }
}
