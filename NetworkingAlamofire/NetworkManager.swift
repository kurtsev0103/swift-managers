//  ************************  //
//  NetworkManager.swift      //
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

class NetworkManager {
    
    // MARK: - Properties
    
    static let shared = NetworkManager()
    private let sharedNetworkHelpers = NetworkHelpers.shared
    private init() {}
    
    // MARK: - Methods
    
    func requestApi(stringURL: String, method: HTTPMethod, headers: HTTPHeaders? = nil, parameters: Parameters? = nil, completion: @escaping (Result<Data?, Error>) -> Void) {
        
        guard NetworkReachabilityManager()?.isReachable == true else {
            completion(.failure(NetworkError.noNetwork))
            return
        }
        
        switch method {
        
        case .GET:
            
            AF.request(stringURL, method: .get, parameters: parameters, headers: headers).responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(response.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        case .POST:
            
            AF.request(stringURL, method: .post, parameters: parameters, headers: headers).responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(response.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        case .PUT:
            
            AF.request(stringURL, method: .put, parameters: parameters, headers: headers).responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(response.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        case .PATCH:
            
            AF.request(stringURL, method: .patch, parameters: parameters, headers: headers).responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(response.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        case .DELETE:
            
            AF.request(stringURL, method: .delete, parameters: parameters, headers: headers).responseJSON { (response) in
                switch response.result {
                case .success(_):
                    completion(.success(response.data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

// MARK: - API requests
extension NetworkManager {
    
    func exampleRequest(completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: "API_URL_STRING") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // If the request contains headers.
        let headers = ["EXAMPLE_API_HEADER_KEY" : "EXAMPLE_API_HEADER_VALUE",
                       "EXAMPLE_API_HEADER_KEY" : "EXAMPLE_API_HEADER_VALUE"]
        request.allHTTPHeaderFields = headers
        
        // If the request contains parameters.
        let params = ["EXAMPLE_API_PARAMS_KEY" : "EXAMPLE_API_PARAMS_VALUE",
                      "EXAMPLE_API_PARAMS_KEY" : "EXAMPLE_API_PARAMS_VALUE"]
        let data = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.httpBody = data
        
        AF.request(request).responseJSON { (response) in
            switch response.result {
            case .success(_):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
