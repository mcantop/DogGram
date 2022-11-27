//
//  ProfileView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct ProfileView: View {
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
                            .foregroundColor(Color.MyTheme.purpleColor)
                    }

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
