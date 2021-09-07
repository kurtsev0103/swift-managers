//  ************************  //
//  AuthManager.swift         //
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
import Firebase

class AuthManager {
    
    // MARK: - Properties
    
    static let shared = AuthManager()
    private let auth = Auth.auth()
    private init() {}
    
    // MARK: - Methods
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let email = email, let password = password else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard AuthHelpers.isFilledTextFields(email, password) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    func logout() {
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print("Error signout: %@", signOutError)
        }
    }
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let email = email, let password = password, let confirmPassword = confirmPassword else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard AuthHelpers.isFilledTextFields(email, password, confirmPassword) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard AuthHelpers.isPasswordsMatched(password, confirmPassword) else {
            completion(.failure(AuthError.passwordsNotMatched))
            return
        }
        
        guard AuthHelpers.isValidEmail(email) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
    
    func resetPassword(email: String?, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let email = email else { return }
        
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(true))
        }
    }
}
