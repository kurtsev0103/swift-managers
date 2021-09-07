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

typealias HTTPHeaders = [String: String]

protocol Networking {
    func request(urlString: String, headers: HTTPHeaders?, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkManager: Networking {
    
    func request(urlString: String, headers: HTTPHeaders?, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
