//
//  AuthService.swift
//  Slattgram
//
//  Created by Maciej on 29/11/2022.
//

import UIKit
import Firebase

final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
//    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    func register(withProvider provider: String, user: User, username: String, image: UIImage, completion: @escaping(Result<Void, Error>) -> Void) {
        let document = Firestore.firestore().collection("users").document()
        let userID = document.documentID
        
        ImageUploader.uploadProfileImage(userID: userID, image: image) { imageUrl in
            let data: [String: Any] = [
                "providerID": user.providerID,
                "provider": provider,
                "id": userID,
                "fullname": user.displayName ?? "",
                "username": username,
                "image": imageUrl,
                "bio": "",
                "dateCreated": FieldValue.serverTimestamp()
            ]
            
            document.setData(data) { error in
                if let error = error {
                    completion(.failure(error))
                }
                
                print("DEBUG: Successfully registered a new user.")
                self.userSession = user
                
                completion(.success(()))
            }
        }
    }
}
