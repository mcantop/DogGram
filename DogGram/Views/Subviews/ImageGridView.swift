//
//  ImageGridView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct ImageGridView: View {
    @ObservedObject var posts: PostArrayObject
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(posts.dataArray) { post in
                NavigationLink {
                    VStack {
                        PostView(post: post)
                        
                        Spacer()
                    }
                    .navigationTitle("\(post.username)'s post")
                } label: {
                    PostView(post: post, showImageOnly: true)
                }
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
    }
}
