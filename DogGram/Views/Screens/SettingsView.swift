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
                // MARK: - SECTION 1 DogGram
                GroupBox {
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .cornerRadius(12)
                        
                        Spacer(minLength: 0)
                        
                        Text("DogGram is the #1 app for posting pictures of our dog and sharing them across the world. We are dog loving community and we are happy to have you!")
                            .font(.footnote)
                    }
                } label: {
                    SettingsLabelView(labelText: "DogGram", image: "dot.radiowaves.left.and.right")
                }
                .padding()
                
                // MARK: - SECTION 2 Profile
                GroupBox {
                    SettingsRowView(icon: "pencil", text: "Name", color: Color.MyTheme.purpleColor)
                    SettingsRowView(icon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                    SettingsRowView(icon: "photo", text: "Picture", color: Color.MyTheme.purpleColor)
                    SettingsRowView(icon: "figure.walk", text: "Sign Out", color: Color.MyTheme.purpleColor)

                } label: {
                    SettingsLabelView(labelText: "Profile", image: "person.fill")
                }
                .padding()

                // MARK: - SECTION 3 Application
                GroupBox {
                    SettingsRowView(icon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    SettingsRowView(icon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
                    SettingsRowView(icon: "globe", text: "DogGram's website", color: Color.MyTheme.yellowColor)
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
