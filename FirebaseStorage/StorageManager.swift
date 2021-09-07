//  ************************  //
//  StorageManager.swift      //
//  ------------------------  //
//         Created by         //
//     Oleksandr Kurtsev      //
//  ------------------------  //
//   github:    kurtsev0103   //
//   linkedin:  kurtsev0103   //
//   facebook:  kurtsev0103   //
//  ------------------------  //
//      Copyright © 2021      //
//  ************************  //

import Foundation
import FirebaseAuth
import FirebaseStorage

class StorageManager {
    
    // MARK: - Properties
    
    static let shared = StorageManager()
    private init() {}
    
    private let reference = Storage.storage().reference()
    private var avatarsReference: StorageReference {
        return reference.child("avatars")
    }
    
    // MARK: - Methods
    
    func upload(userPhoto: UIImage, userId: String, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let scaledImage = userPhoto.scaleToSafeUploadSize else { return }
        guard let imageData = scaledImage.jpegData(compressionQuality: 0.4) else { return }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        avatarsReference.child(userId).putData(imageData, metadata: metadata) { (metadata, error) in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            self.avatarsReference.child(userId).downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(downloadURL))
            }
        }
    }
    
    func downloadImage(url: URL, completion: @escaping (Result<UIImage?, Error>) -> Void) {
        let ref = Storage.storage().reference(forURL: url.absoluteString)
        let megaByte = Int64(1 * 1024 * 1024)
        ref.getData(maxSize: megaByte) { (data, error) in
            guard let imageData = data else {
                completion(.failure(error!))
                return
            }
            completion(.success(UIImage(data: imageData)))
        }
    }
}
