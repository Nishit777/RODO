//
//  NetworkClass.swift
//
//

//  Copyright © 2023 NKP. All rights reserved.
//

import Foundation

enum NetworkError: String, Error {
    case invalidRequest = "Request is invalid"
    case serverError = "Something is wrong on our end"
    case invalidResponse = "Something is wrong"
}

class NetworkService: NSObject
{
    func triggerService<T:Decodable>(url: String,
                                    resultType:T.Type ,
                                    completion: @escaping (Swift.Result<T,NetworkError>) -> ()) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data
            else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(resultType.self, from: data)
                
                completion(.success(response))
                
            } catch {
                completion(.failure(.invalidResponse))
            }
            
            if error != nil {
                completion(.failure(.serverError))
            }
        }
        dataTask.resume()
    }
}
