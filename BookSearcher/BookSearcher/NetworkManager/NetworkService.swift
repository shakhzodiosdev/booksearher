//
//  NetworkManager.swift
//  BookSearcher
//
//  Created by Shakhzod Bobokhonov on 6/16/21.
//

import Foundation

class NetworkService {
    
    func request(urlString :  String, completion: @escaping(Data?, Error?) -> Void){
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request) { (data, error) in
            completion(data,error)
        }
        
        task.resume()
    }
    
    private func createDataTask(from request : URLRequest, completion: @escaping(Data?, Error?) -> Void) -> URLSessionTask{
        return URLSession.shared.dataTask(with: request) { data,response,error in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }
}
