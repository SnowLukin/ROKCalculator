//
//  TotalTabView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct TotalTabView: View {
    
    let kingdom: Kingdom
    
    var body: some View {
        VStack {
            TotalTabPreviewView(kingdom: kingdom)
            TotalTabDetailView(kingdom: kingdom)
        }
    }
}

struct TotalTabView_Previews: PreviewProvider {
    static var previews: some View {
        let mainViewModel = RssCalculatorViewModel()
        let kingdom = mainViewModel.kingdoms[0]
        return TotalTabView(kingdom: kingdom)
    }
}
