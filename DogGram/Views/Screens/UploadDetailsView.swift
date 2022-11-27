//
//  UploadDetailsView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct UploadDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var captionText = ""
    @Binding var imageSelected: UIImage
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                        
                        Text("Back")
                            .fontWeight(.regular)
                        
                        Spacer()
                    }
                }
                
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                TextField("Caption (optional)", text: $captionText, axis: .vertical)
                    .padding()
                    .background(Color.MyTheme.beigeColor)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                
                Button {
                    
                } label: {
                    Text("Upload!")
                        .foregroundColor(Color.MyTheme.yellowColor)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.purpleColor)
                        .cornerRadius(15)
                }
                .shadow(radius: 10)
                
                Spacer()
            }
            .background(
            Image("dog1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.55)
                .blur(radius: 55)
            )
            .font(.headline)
        .padding(.horizontal, 32)
        }
    }
}

struct UploadPostDetailsView_Previews: PreviewProvider {
    @State static var imageSelected = UIImage(named: "dog1")!
    
    static var previews: some View {
            UploadDetailsView(imageSelected: $imageSelected)
    }
}
