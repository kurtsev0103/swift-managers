//  ************************  //
//  NetworkError.swift        //
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

enum NetworkError {
    case noNetwork
    case failed
    case cancelled
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noNetwork:
            return NSLocalizedString("NetworkError: No network", comment: "")
        case .failed:
            return NSLocalizedString("NetworkError: Failed network", comment: "")
        case .cancelled:
            return NSLocalizedString("NetworkError: Canceled network", comment: "")
        }
    }
}
