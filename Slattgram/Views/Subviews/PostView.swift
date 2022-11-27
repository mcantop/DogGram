//
//  PostView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    @State var postImage = UIImage(named: "dog1")
    @State var showImageOnly = false
    @State var animate = false
    @State var addHeartAnimation: Bool
    @State private var showingConfirmationDialog = false
    
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
                    
                    Button {
                        showingConfirmationDialog.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    .confirmationDialog("title", isPresented: $showingConfirmationDialog) {
                        Button("Share", role: .none) {
                            sharePost()
                        }
                        
                        Button("Report", role: .destructive) {
                            
                        }
                        
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("What would you like to do?")
                    }
                    
                }
                .padding(8)
            }
            
            // MARK: - Image
            ZStack {
                Image(uiImage: postImage!)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture(count: 2) {
                        if !post.likedByUser {
                            likePost()
                        }
                    }
                
                if addHeartAnimation {
                    LikeAnimationView(animate: $animate)
                }
            }
            
            // MARK: - Footer
            if !showImageOnly {
                HStack(spacing: 20) {
                    Button {
                        if post.likedByUser {
                            unlikePost()
                        } else {
                            likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .foregroundColor(post.likedByUser ? .red : .primary)
                    }
                    
                    
                    NavigationLink {
                        CommentsView()
                    } label: {
                        Image(systemName: "bubble.middle.bottom")
                            .foregroundColor(.primary)
                    }
                    
                    Button {
                            sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.primary)
                    }
                    
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
    
    func likePost() {
        let updatedPost = Post(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        
        self.post = updatedPost
        
        animate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            animate = false
        }
    }
    
    func unlikePost() {
        let updatedPost = Post(postID: post.postID, userID: post.userID, username: post.username, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        
        self.post = updatedPost
    }
    
    func sharePost() {
        let message = "Check out this post on Slattgram. SLATT 🐍"
        guard let image = postImage else { return }
        guard let url = URL(string: "https://www.youngstonerliferecords.com") else { return }
        
        let activity = UIActivityViewController(activityItems: [message, image, url],
                                                applicationActivities: nil)
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let firstWindow = firstScene.windows.first else { return }
        let viewController = firstWindow.rootViewController
        viewController?.present(activity, animated: true)
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
        PostView(post: post, addHeartAnimation: true)
            .previewLayout(.sizeThatFits)
    }
}
