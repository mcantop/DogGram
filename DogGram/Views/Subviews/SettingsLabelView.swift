//
//  SettingsLabelView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var image: String
    
    var body: some View {
        VStack {
            HStack {
                Text(labelText)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: image)
            }
            
            Divider()
                .padding(.vertical, 4)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "test label", image: "heart")
            .previewLayout(.sizeThatFits)
    }
}
