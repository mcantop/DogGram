//
//  SignInWithGoogle.swift
//  Slattgram
//
//  Created by Maciej on 27/11/2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct GoogleService {
    static func SigIn(rootViewController: UIViewController, completion: @escaping(Result<User, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
                
        GIDSignIn.sharedInstance.signIn(with: config, presenting: rootViewController) { user, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let user = result?.user else { return }
                
                completion(.success(user))
            }
        }
    }
}
