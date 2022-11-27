//
//  CommentsView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var commentText = ""
    @State private var comments = [Comment]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(comments) { comment in
                        MessagesView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .cornerRadius(22)
                
                TextField("Add a comment...", text: $commentText)
                
                Button("Send") {
                    print("DEBUG: Add comment to a post.")
                }
            }
            .padding(8)
        }
        .navigationTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.greenColor)
        .onAppear {
            getComments()
        }
    }
    
    func getComments() {
        let comment1 = Comment(commentID: "",
                               userID: "",
                               username: "future",
                               text: "Testing a little bit longer new comment comment comment",
                               dateCreated: Date())
        
        let comment2 = Comment(commentID: "",
                               userID: "",
                               username: "future",
                               text: "Testing a little bit longer new comment comment comment",
                               dateCreated: Date())
        
        let comment3 = Comment(commentID: "",
                               userID: "",
                               username: "future",
                               text: "Testing a little bit longer new comment comment comment",
                               dateCreated: Date())
        
        self.comments.append(contentsOf: [comment1, comment2, comment3])
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CommentsView()
        }
    }
}
