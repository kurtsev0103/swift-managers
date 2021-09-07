//  ************************  //
//  AuthError.swift           //
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

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("AuthError: Fill in all the input fields", comment: "")
        case .invalidEmail:
            return NSLocalizedString("AuthError: Email format is not valid", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("AuthError: Passwords not matched", comment: "")
        case .serverError:
            return NSLocalizedString("AuthError: Server error", comment: "")
        case .unknownError:
            return NSLocalizedString("AuthError: Unknown error", comment: "")
        }
    }
}
