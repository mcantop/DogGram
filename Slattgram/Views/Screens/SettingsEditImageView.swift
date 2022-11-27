//
//  SettingsEditImageView.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SettingsEditImageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage
    @State private var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(spacing: 16) {
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(15)
            
            Button {
                showingImagePicker.toggle()
            } label: {
                Text("Import")
                    .foregroundColor(Color.MyTheme.greenColor)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(15)
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
                    .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.greenColor)
            }
            
            Button {
                
            } label: {
                Text("Save!")
                    .foregroundColor(Color.MyTheme.purpleColor)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.greenColor)
                    .cornerRadius(15)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(title)
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsEditImageView(title: "title", description: "desc", selectedImage: UIImage(named: "dog1")!)
        }
    }
}
