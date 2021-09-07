//  ************************  //
//  NetworkDataFetcher.swift  //
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

protocol DataFetcher {
    func fetchJSONData<T: Decodable>(urlString: String, headers: HTTPHeaders?, response: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkManager()) {
        self.networking = networking
    }
    
    func fetchJSONData<T: Decodable>(urlString: String, headers: HTTPHeaders?, response: @escaping (T?) -> Void) {
        networking.request(urlString: urlString, headers: headers) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
                        
            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
