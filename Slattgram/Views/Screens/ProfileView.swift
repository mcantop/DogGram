//
//  ProfileView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var profileDisplayName: String
    var profileUserID: String
    var posts = PostArrayObject()
    var isMyProfile: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            
            Divider()
            
            ImageGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if isMyProfile {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.greenColor)                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(profileDisplayName: "Future", profileUserID: "", isMyProfile: true)
        }
    }
}
