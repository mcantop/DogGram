//
//  OnboardingView.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI
import Firebase

struct OnboardingView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) private var dismiss
    @State private var showingOnboardingNext = false
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var isLoading = false
    @State private var user: User?
    
    var body: some View {
        VStack(spacing: 24) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(25)
            
            Text("Welcome to Slattgram 🐍")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.greenColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text("Slattgram is the #1 app for posting pictures of our snakes and sharing them across the world. We are snake loving community and we are happy to have you! SLATT")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(colorScheme == .light ? Color.MyTheme.purpleColor :  Color.MyTheme.beigeColor)
            
            VStack(spacing: 12) {
                Button {
                    showingOnboardingNext.toggle()
                } label: {
                    SignInWithAppleButton()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                }
                
                Button {
                    isLoading.toggle()
                    GoogleService.SigIn(rootViewController: getRootViewController()) { result in
                        switch result {
                        case .failure(let error):
                            errorMessage = error.localizedDescription
                            showingError.toggle()
                        case .success(let user):
                            self.user = user
                            isLoading.toggle()
                            showingOnboardingNext.toggle()
                        }
                    }
                } label: {
                    Label("Sign in with Google", systemImage: "globe")
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 222/255, green: 82/255, blue: 70/255))
                        .cornerRadius(6)
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue as guest".uppercased())
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 12)
            }
        }
        .padding()
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
        .fullScreenCover(isPresented: $showingOnboardingNext) {
            if let user = user {
                OnboardingNextView(user: user)
            }
        }
        .alert("Error", isPresented: $showingError) {
            Button("Close", role: .cancel) { isLoading.toggle() }
        } message: {
            Text(errorMessage)
        }
        .overlay(
            ZStack {
                if isLoading {
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.MyTheme.whiteBlack)
                        .cornerRadius(15)
                }
            }
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
