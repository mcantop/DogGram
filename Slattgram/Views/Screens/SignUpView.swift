//
//  SignUpView.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI

struct SignUpView: View {
    @State private var showingOnboarding = false
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
            
            Text("You're not signed in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text("Click the button below to create an account and join other slatts!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Button {
                showingOnboarding.toggle()
            } label: {
                Text("SIGN IN/SIGN UP")
                    .foregroundColor(Color.MyTheme.greenColor)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(15)
            }
            
            Spacer()
            Spacer()
        }
        .padding(40)
        .fullScreenCover(isPresented: $showingOnboarding) {
            OnboardingView()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
