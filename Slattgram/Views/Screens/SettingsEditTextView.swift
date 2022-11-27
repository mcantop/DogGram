//
//  SettingsEditTextView.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SettingsEditTextView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var text = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(placeholder, text: $text)
                .padding()
                .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                .cornerRadius(15)
            
            Button {
                
            } label: {
                Text("Save!")
                    .foregroundColor(Color.MyTheme.purpleColor)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.greenColor)
                    .cornerRadius(15)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(title)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsEditTextView(title: "Test Title", description: "test Description", placeholder: "blablabla")
        }
    }
}
