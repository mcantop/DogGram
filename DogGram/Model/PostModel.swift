//
//  PostModel.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID()
    var postID: String
    var userID: String
    var username: String
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
