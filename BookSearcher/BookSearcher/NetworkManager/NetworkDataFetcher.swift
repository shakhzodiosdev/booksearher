//
//  NetworkDataFetcher.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService : NetworkService = NetworkService()){
        self.networkService = networkService
    }
    
    func fetchBooks(urlString: String, completion: @escaping([Item]?)-> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let response = try? decoder.decode(Books.self, from: data)
            
            completion(response?.items)
        }
    }
}
