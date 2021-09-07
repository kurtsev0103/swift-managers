//  ************************  //
//  FirestoreManager.swift    //
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

import UIKit
import FirebaseAuth
import FirebaseFirestore

class FirestoreManager {
    
    // MARK: - Properties
    
    static let shared = FirestoreManager()
    private let dataBase = Firestore.firestore()
    private init() {}
    
    private var usersReference: CollectionReference {
        return dataBase.collection("users")
    }
    
    var currentUser: FirestoreUserModel!
    
    // MARK: - Methods
    
    func saveProfile(user: FirestoreUserModel, userImage: UIImage?, completion: @escaping (Result<FirestoreUserModel, Error>) -> Void) {
        self.usersReference.document(user.id).setData(user.representation) { (error) in
            guard let error = error else {
                completion(.success(user))
                return
            }
            completion(.failure(error))
        }
    }
    
    func getUserData(user: User, completion: @escaping (Result<FirestoreUserModel, Error>) -> Void) {
        let docRef = usersReference.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let user = FirestoreUserModel(document: document) else {
                    completion(.failure(FirestoreError.cannotUnwrapToFirestoreUserModel))
                    return
                }
                self.currentUser = user
                completion(.success(user))
            } else {
                completion(.failure(FirestoreError.cannotGetUserInfo))
            }
        }
    }
}
