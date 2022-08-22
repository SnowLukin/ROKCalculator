//
//  KingdomCreationView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 15.08.2022.
//

import SwiftUI

struct KingdomCreationView: View {
    
    @StateObject private var viewModel = KingdomCreationViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismissView
    
    let kingdoms: [Kingdom]
    
    @State private var value1 = 0
    @State private var value2 = 0
    @State private var value3 = 0
    @State private var value4 = 0
    
    let gridWidth = UIScreen.main.bounds.width / 6
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack {
                Text("Kingdom")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                nameGrid()
                buttons()
                Spacer()
            }.padding()
                .padding(.vertical, 20)
        }
    }
}

struct KingdomCreationView_Previews: PreviewProvider {
    static var previews: some View {
        KingdomCreationView(kingdoms: [])
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension KingdomCreationView {
    @ViewBuilder
    private func buttons() -> some View {
        VStack {
            Button {
                if let name = getKingdomName() {
                    withAnimation {
                        viewModel.createKingdom(name: name, for: viewContext)
                        dismissView()
                    }
                }
            } label: {
                Text("Create")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color("content"))
                    .cornerRadius(12)
            }.disabled(isCreateKingdomButtonDisabled())
            
            Button {
                withAnimation {
                    dismissView()
                }
            } label: {
                Text("Cancel")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(Color("content"))
                    .cornerRadius(12)
            }
        }.padding(.vertical)
    }
    
    @ViewBuilder
    private func nameGrid() -> some View {
        LazyVGrid(
            columns: [
                GridItem(.fixed(gridWidth)),
                GridItem(.fixed(gridWidth)),
                GridItem(.fixed(gridWidth)),
                GridItem(.fixed(gridWidth)),
                GridItem(.fixed(gridWidth))
            ]
        ) {
            Text("#")
                .font(.title)
            CreationInputContainer(value: $value1)
                .frame(width: gridWidth)
            CreationInputContainer(value: $value2)
                .frame(width: gridWidth)
            CreationInputContainer(value: $value3)
                .frame(width: gridWidth)
            CreationInputContainer(value: $value4)
                .frame(width: gridWidth)
        }
    }
    
    private func getKingdomName() -> Int? {
        let stringName = "\(value1)\(value2)\(value3)\(value4)"
        if let intName = Int(stringName) {
            return intName
        } else {
            return nil
        }
    }
    
    private func isCreateKingdomButtonDisabled() -> Bool {
        if let name = getKingdomName() {
            if kingdoms.map({ Int($0.name) }).contains(name) {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}

struct CreationInputContainer: View {
    @Binding var value: Int
    
    var body: some View {
        Menu {
            ForEach(0..<10, id: \.self) { number in
                Button(String(number)) {
                    value = number
                }
            }
        } label: {
            Text("\(value)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("content"))
                .cornerRadius(12)
        }.preferredColorScheme(.dark)
    }
}
