//
//  OnboardingNextView.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI
import Firebase

struct OnboardingNextView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @State private var username = ""
    @State private var showingImagePicker = false
    @State private var imageSelected = UIImage(named: "logo")!
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var user: User
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "xmark").bold()                        
                    }
                }
                .accentColor(Color.MyTheme.greenColor)

                Spacer()
            }
            
            Spacer()
            
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.greenColor)
            
            TextField("Your username", text: $username)
                .padding()
                .background(Color.MyTheme.beigeColor)
                .cornerRadius(15)
                .shadow(radius: 10)
            
            Button {
                showingImagePicker.toggle()
                print(user.displayName ?? "")
                
            } label: {
                Text("Finish: Add profile picture")
                    .foregroundColor(Color.MyTheme.purpleColor)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.greenColor)
                    .cornerRadius(15)
            }
            .buttonStyle(.plain)
            .disabled(username.isEmpty)
            .animation(.easeInOut(duration: 0.25), value: username)

            Spacer()
            
            Spacer()
        }
        .preferredColorScheme(.light)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .sheet(isPresented: $showingImagePicker, onDismiss: register) {
            ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
                .preferredColorScheme(.dark)
                .accentColor( Color.MyTheme.greenColor)
        }
    }
    
    func register() {
        AuthViewModel.shared.register(withProvider: "Google", user: user, username: username, image: imageSelected) { result in

            switch result {
            case .failure(let error):
                print("DEBUG: Couldn't register a new user with error - \(error.localizedDescription)")
            case .success:
                print("DEBUG: Successfully registerd user")
            }
        }
    }
}

//struct OnboardingNextView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingNextView()
//    }
//}
