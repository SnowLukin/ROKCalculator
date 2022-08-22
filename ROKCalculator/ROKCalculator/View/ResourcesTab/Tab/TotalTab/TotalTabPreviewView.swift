//
//  TotalTabPreviewView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 26.07.2022.
//

import SwiftUI

struct TotalTabPreviewView: View {
    
    @ObservedObject var kingdom: Kingdom
    
    var body: some View {
        VStack {
            totalResources
            chestsResources
        }
    }
}

struct TotalTabPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        TotalTabPreviewView(kingdom: kingdom)
            .environment(\.managedObjectContext, context)
    }
}

extension TotalTabPreviewView {
    private var totalResources: some View {
        VStack {
            Text("Total resources")
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .font(.caption)
                    Text("Chests are not included")
                        .font(.caption)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ]
                ) {
                    ResourceItem(type: .food, value: kingdom.totalResources(of: .food))
                    ResourceItem(type: .wood, value: kingdom.totalResources(of: .wood))
                    ResourceItem(type: .stone, value: kingdom.totalResources(of: .stone))
                    ResourceItem(type: .gold, value: kingdom.totalResources(of: .gold))
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(
                Color("content")
            )
            .cornerRadius(7)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            Color("box")
        )
        .cornerRadius(12)
    }
    
    private var chestsResources: some View {
        VStack {
            Text("Chests resources")
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .font(.caption)
                    Text("Represents only one resource type")
                        .font(.caption)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 70)),
                    ]
                ) {
                    ResourceItem(type: .food, value: kingdom.totalChestValue(of: .food))
                    ResourceItem(type: .wood, value: kingdom.totalChestValue(of: .wood))
                    ResourceItem(type: .stone, value: kingdom.totalChestValue(of: .stone))
                    ResourceItem(type: .gold, value: kingdom.totalChestValue(of: .gold))
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(
                Color("content")
            )
            .cornerRadius(7)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            Color("box")
        )
        .cornerRadius(12)
    }
}
