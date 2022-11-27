//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import Foundation

final class PostArrayObject: ObservableObject {
    @Published var dataArray = [Post]()
    
    init() {
        let post1 = Post(postID: "", userID: "", username: "Future", caption: "She belong to the streets", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = Post(postID: "", userID: "", username: "Young Thug", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = Post(postID: "", userID: "", username: "Future", caption: "FREE YSL", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = Post(postID: "", userID: "", username: "Future", dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(contentsOf: [post1, post2, post3, post4])
    }
}
