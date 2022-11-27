//
//  UploadView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct UploadView: View {
    @State private var showingImagePicker = false
    @State private var imageSelected = UIImage(named: "logo")!
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var showingUploadDetails = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button {
                    sourceType = .camera
                    showingImagePicker.toggle()
                } label: {
                    Text("Take a photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.yellowColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.purpleColor)
                
                Button {
                    sourceType = .photoLibrary
                    showingImagePicker.toggle()
                } label: {
                    Text("Import a photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.purpleColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.MyTheme.yellowColor)
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: segueToUploadDetails) {
                ImagePicker(imageSelected: $imageSelected,
                            sourceType: $sourceType)
                .ignoresSafeArea()
            }
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showingUploadDetails) {
                        UploadDetailsView(imageSelected: $imageSelected)
                }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    private func segueToUploadDetails() {
        if imageSelected != UIImage(named: "logo") {
            showingUploadDetails.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
