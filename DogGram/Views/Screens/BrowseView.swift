//
//  BrowseView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct BrowseView: View {
    var posts = PostArrayObject()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CarouselView()
            ImageGridView(posts: posts)
        }
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BrowseView()
        }
    }
}
