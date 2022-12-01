//
//  SlattgramApp.swift
//  Slattgram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct SlattgramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Group {
                
                ContentView()
                    .onOpenURL { url in
                        GIDSignIn.sharedInstance.handle(url)
                    }
            }
        }
    }
}

// Used for Google Log In
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
