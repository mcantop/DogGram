//
//  CommentModel.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct Comment: Identifiable, Hashable {
    var id = UUID()
    var commentID: String
    var userID: String
    var username: String
    var text: String
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
