//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SettingsRowView: View {
    var icon: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36)
            
            Text(text)
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
        }
        .foregroundColor(.primary)
        .padding(.vertical, 4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(icon: "heart.fill", text: "Row Title", color: .blue)
            .previewLayout(.sizeThatFits)
    }
}
