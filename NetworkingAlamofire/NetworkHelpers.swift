//  ************************  //
//  NetworkHelpers.swift      //
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
import Alamofire

enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

class NetworkHelpers {
    
    // MARK: - Properties
    
    static let shared = NetworkHelpers()
    private init() {}
    
    // MARK: - Methods
    
    func parseExampleModel(_ data: Data) -> ExampleModel? {
        do {
            let model = try JSONDecoder().decode(ExampleModel.self, from: data)
            return model
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
