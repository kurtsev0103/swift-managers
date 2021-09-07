//  ************************  //
//  AuthHelpers.swift         //
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

class AuthHelpers {
    
    static func isValidEmail(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func isFilledTextFields(_ textOne: String?, _ textTwo: String?) -> Bool {
        guard let textOne = textOne, let textTwo = textTwo else { return false }
        guard !textOne.isEmpty && !textTwo.isEmpty else { return false }
        return true
    }
    
    static func isFilledTextFields(_ textOne: String?, _ textTwo: String?, _ textThree: String?) -> Bool {
        guard let textOne = textOne, let textTwo = textTwo, let textThree = textThree else { return false }
        guard !textOne.isEmpty && !textTwo.isEmpty && !textThree.isEmpty else { return false }
        return true
    }
    
    static func isPasswordsMatched(_ passOne: String?, _ passTwo: String?) -> Bool {
        guard let passOne = passOne, let passTwo = passTwo else { return false }
        guard passOne == passTwo else { return false }
        return true
    }
    
    static func isMissingSpaces(_ string: String?) -> Bool {
        guard let string = string else { return false }
        guard string.trimmingCharacters(in: .whitespacesAndNewlines).count >= 3 else { return false }
        return true
    }
}
