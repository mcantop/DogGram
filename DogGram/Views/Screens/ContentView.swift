//
//  ContentView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                FeedView(posts: PostArrayObject())
            }
            .tabItem {
                Image(systemName: "book")
                Text("Feed")
            }
            
            NavigationStack {
                BrowseView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Browse")
            }
            
            UploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Upload")
                }
            
            NavigationStack {
                ProfileView(profileDisplayName: "My Profile", profileUserID: "", isMyProfile: true)
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
        .accentColor(Color.MyTheme.purpleColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
