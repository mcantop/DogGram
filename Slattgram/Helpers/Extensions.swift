//
//  Extensions.swift
//  DogGram
//
//  Created by Maciej on 26/11/2022.
//

import SwiftUI

extension Color {
    struct MyTheme {
        static var purpleColor: Color {
            return Color("ColorPurple")
        }
        
        static var greenColor: Color {
            return Color("ColorGreen")
        }
        
        static var beigeColor: Color {
            return Color("ColorBeige")
        }
        
        static var whiteBlack: Color {
            return Color("ColorWhiteBlack")
        }
    }
}

// Used for Google Log In
extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init() }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
}
