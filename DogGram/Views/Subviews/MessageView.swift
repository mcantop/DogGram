//
//  MessageView.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct MessagesView: View {
    @State var comment: Comment
    
    var body: some View {
        HStack(alignment: .top) {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(comment.text)
                    .padding(8)
                    .foregroundColor(.primary)
                    .background(.gray.opacity(0.5))
                    .cornerRadius(8)
            }
            
            Spacer(minLength: 0)
        }
        .padding(8)
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var comment = Comment(commentID: "",
                          userID: "",
                          username: "future",
                          text: "Testing a little bit longer new comment comment comment",
                          dateCreated: Date())
    
    static var previews: some View {
        MessagesView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
