//
//  SettingsView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // MARK: - SECTION 1 Slattgram
                GroupBox {
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                        
                        Spacer(minLength: 6)
                        
                        Text("Slattgram is the #1 app for posting pictures of our snakes and sharing them across the world. We are snake loving community and we are happy to have you! SLATT")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "Slattgram", image: "globe")
                }
                .padding()
                
                // MARK: - SECTION 2 Profile
                GroupBox {
                    NavigationLink {
                        SettingsEditTextView(title: "Edit Username", description: "You can edit your username here. This will be seen by other users on your profile and on your posts!", placeholder: "Enter your new username")
                    } label: {
                        SettingsRowView(icon: "pencil", text: "Name", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditTextView(title: "Edit Bio", description: "You can edit your bio here. This will be seen by other slimes on your profile!", placeholder: "Enter your new bio")
                    } label: {
                        SettingsRowView(icon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                    }
                    
                    NavigationLink {
                        SettingsEditImageView(title: "Edit Picture", description: "Your profile picture will be shown on your profile and on your posts. Most slimes make it an image of themselves or of their snake!", selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(icon: "photo", text: "Picture", color: Color.MyTheme.purpleColor)
                    }
                    
                    SettingsRowView(icon: "figure.walk", text: "Sign Out", color: Color.MyTheme.purpleColor)
                    
                } label: {
                    SettingsLabelView(labelText: "Profile", image: "person.fill")
                }
                .padding()
                
                // MARK: - SECTION 3 Application
                GroupBox {
                    Button {
                        openCustomURL(urlString: "https://privacy.wmg.com/3EE/privacy-policy")
                    } label: {
                        SettingsRowView(icon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.greenColor)
                    }
                    
                    Button {
                        openCustomURL(urlString: "https://www.atlanticrecords.com/terms-of-use")
                    } label: {
                        SettingsRowView(icon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.greenColor)
                    }
                    
                    Button {
                        openCustomURL(urlString: "https://www.youngstonerliferecords.com")
                    } label: {
                        SettingsRowView(icon: "globe", text: "YSL website", color: Color.MyTheme.greenColor)
                        
                    }
                } label: {
                    SettingsLabelView(labelText: "Application", image: "apps.iphone")
                }
                .padding()
                
                // MARK: - SECTION 4 Sign off
                GroupBox {
                    VStack(spacing: 4) {
                        Text("SlattGram was made by slimes")
                        Text("YSL 🐍").bold()
                        Text("All Rights Reserved")
                            .foregroundColor(.gray)
                        Text("Copyright 2022")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 64)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
