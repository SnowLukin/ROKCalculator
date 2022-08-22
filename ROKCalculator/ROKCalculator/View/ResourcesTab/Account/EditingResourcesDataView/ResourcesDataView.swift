//
//  ResourcesDataView.swift
//  ROKCalculator
//
//  Created by Snow Lukin on 10.08.2022.
//

import SwiftUI

enum TagType: String, CaseIterable {
    case all = "All"
    case current = "Current resources"
    case food = "Food"
    case wood = "Wood"
    case stone = "Stone"
    case gold = "Gold"
    case gems = "Gems"
    case chests = "Chests"
}




struct ResourcesDataView: View {
    
    @ObservedObject var account: Account
    let tag: TagType
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @State private var text = ""
    @State private var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    var body: some View {
        ScrollView {
            VStack {
                imageHolder
                if image != nil {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Apply")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(Color("box"))
                                .cornerRadius(9)
                                .padding(.leading)
                        }
                        Button {
                            
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(Color("box"))
                                .cornerRadius(9)
                                .padding(.trailing)
                        }
                    }
                }
            }
            VStack(spacing: 0) {
                HStack {
                    Text(viewModel.currentTag.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Menu {
                        ForEach(TagType.allCases, id: \.self) { tagType in
                            Button {
                                withAnimation {
                                    viewModel.currentTag = tagType
                                }
                            } label: {
                                HStack {
                                    Text(tagType.rawValue)
                                    Spacer()
                                    if viewModel.currentTag == tagType {
                                        Image(systemName: "circle.fill")
                                    }
                                }
                            }
                        }
                    } label: {
                        Text("Filter")
                            .font(.subheadline.bold())
                            .foregroundColor(.blue)
                    }.preferredColorScheme(.dark)
                }.padding()
                    .padding(.horizontal, 10)
                RssGridView(account: account, tag: viewModel.currentTag)
                    .padding()
                    .background(Color("content"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom)
            }.background(Color("box"))
                .cornerRadius(12)
                .padding()
        }
        .padding(.top)
        .background(Color("background"))
        .onChange(of: inputImage) { _ in loadImage() }
        .onAppear {
            viewModel.currentTag = tag
        }
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
                .ignoresSafeArea()
        }
    }
}

struct ResourcesDataView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let kingdom = context.registeredObjects.first(where: { $0 is Kingdom }) as! Kingdom
        let account = kingdom.wrappedAccounts[0]
        return NavigationView {
            ResourcesDataView(account: account, tag: .current)
                .environmentObject(AccountViewModel())
        }
    }
}

extension ResourcesDataView {
    
    private func loadImage() {
        guard let inputImage = inputImage else { return }
        withAnimation {
            image = Image(uiImage: inputImage)
        }
    }
    
    private var imageHolder: some View {
        ZStack {
            image?.resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(height: UIScreen.main.bounds.height / 5)
        .frame(maxWidth: .infinity)
        .background(Color("content"))
        .cornerRadius(12)
        .overlay(alignment: .bottomTrailing) {
            Button {
                withAnimation {
                    showImagePicker.toggle()
                }
            } label: {
                Image(systemName: "photo.circle.fill")
                    .font(.system(size: 35))
                    .foregroundColor(
                        Color(uiColor: .gray)
                    )
                    .padding()
            }
        }
        .padding(.horizontal, 10)
    }
}
