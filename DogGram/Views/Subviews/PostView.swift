//
//  PostView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State var showImageOnly: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            if !showImageOnly {
                HStack {
                    NavigationLink {
                        ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(8)
            }
            
            // MARK: - Image
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: - Footer
            if !showImageOnly {
                HStack(spacing: 20) {
                    Image(systemName: "heart")
                    
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }
                    
                    Image(systemName: "paperplane")
                    
                    Spacer()
                }
                .font(.title3)
                .padding(8)
                
                HStack {
                    Text(post.username).fontWeight(.semibold) +
                    Text(" ") +
                    Text(post.caption ?? "")
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var post = Post(postID: "",
                                userID: "",
                                username: "username",
                                caption: "Really long caption for testing kkkkkkk purposes here",
                                dateCreated: Date(),
                                likeCount: 0,
                                likedByUser: false)
    
    static var previews: some View {
        PostView(post: post)
            .previewLayout(.sizeThatFits)
    }
}
