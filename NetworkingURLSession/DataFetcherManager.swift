//  ************************  //
//  DataFetcherManager.swift  //
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

class DataFetcherManager {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
}

// MARK: - API requests
extension DataFetcherManager {
    
    func exampleRequest(completion: @escaping (ExampleModel?) -> Void) {
        let urlString = "API_URL_STRING"
        dataFetcher.fetchJSONData(urlString: urlString, headers: nil, response: completion)
    }
}
