//
//  ContentView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var currentUserID: String? = nil
    
    var body: some View {
        TabView {
            NavigationStack {
                FeedView(posts: PostArrayObject())
                    .toolbarBackground(Color.MyTheme.whiteBlack, for: .tabBar, .navigationBar)
            }
            .tabItem {
                Image(systemName: "book")
                Text("Feed")
            }
            
            
            NavigationStack {
                BrowseView()
                    .toolbarBackground(Color.MyTheme.whiteBlack, for: .tabBar, .navigationBar)
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Browse")
            }
            
            UploadView()
                .toolbarBackground(.hidden, for: .tabBar, .navigationBar)
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Upload")
                }
            
            ZStack {
                if currentUserID != nil {
                    NavigationStack {
                        ProfileView(profileDisplayName: "My Profile", profileUserID: "", isMyProfile: true)
                            .toolbarBackground(Color.MyTheme.whiteBlack, for: .tabBar, .navigationBar)
                    }
                } else {
                    SignUpView()
                        .toolbarBackground(Color.MyTheme.whiteBlack, for: .tabBar, .navigationBar)
                }
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.greenColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
