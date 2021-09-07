//  ************************  //
//  FirestoreError.swift      //
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

enum FirestoreError {
    case notFilled
    case photoNotExist
    case cannotGetUserInfo
    case cannotUnwrapToFirestoreUserModel
}

extension FirestoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("FirestoreError: Not filled", comment: "")
        case .photoNotExist:
            return NSLocalizedString("FirestoreError: Photo not exist", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("FirestoreError: Cannot get user info", comment: "")
        case .cannotUnwrapToFirestoreUserModel:
            return NSLocalizedString("FirestoreError: Cannot unwrap to FirestoreUserModel", comment: "")
        }
    }
}
