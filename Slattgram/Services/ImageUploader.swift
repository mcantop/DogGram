//
//  ImageUploader.swift
//  Slattgram
//
//  Created by Maciej on 30/11/2022.
//

import Foundation
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadProfileImage(userID: String, image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
        
        let ref = Storage.storage().reference(withPath: "users/\(userID)/profile")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload profile Image - \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
