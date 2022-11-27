//
//  ProfileHeaderView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var profileDisplayName: String
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
            
            Text("@\(profileDisplayName)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("This is the are where the user can add a bio to their profile :D")
                .font(.callout)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("6")
                        .font(.title)
                    
                    Capsule()
                        .fill(.gray)
                        .frame(width: 20, height: 2)
                    
                    Text("POSTS")
                        .font(.callout)
                }
                
                VStack(spacing: 8) {
                    Text("813")
                        .font(.title)
                    
                    Capsule()
                        .fill(.gray)
                        .frame(width: 20, height: 2)
                    
                    Text("LIKES")
                        .font(.callout)
                }
            }
        }
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    @State static var name = "Future"
    
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
            .previewLayout(.sizeThatFits)
    }
}
