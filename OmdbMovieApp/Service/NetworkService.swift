//
//  NetworkService.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import Foundation


class NetworkService {
    
    
    private static let session = URLSession.shared
    
    static func generateRequest(pathParams : [String] = [],queryParameters : [String:String]) -> NSMutableURLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.urlScheme
        
        
        var pathString = ""
        pathParams.forEach { path in
            pathString += "/\(path)"
        }
        urlComponents.path = pathString
        
        var queryItems : [URLQueryItem] = []
        queryParameters.forEach { queryItem in
            queryItems.append(URLQueryItem(name: queryItem.key, value: queryItem.value))
        }
        
        urlComponents.host = Constants.baseUrl
        urlComponents.queryItems = queryItems
        
        let url = URL(string: urlComponents.string!)
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 2.0)
        return request
    }
    
    static func request<T:Codable>(request : URLRequest,decodingType : T.Type,completionHandler : @escaping (Result<T,Error>) -> Void){
        
        
        session.dataTask(with: request) { data, _, err in
            if err != nil {
                completionHandler(.failure(NetworkError.connectionErr))
            }
            
            if let data {
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decodedData))
                }catch {
                    completionHandler(.failure(error))
                }
                
                
            }
        }.resume()
    }
}

enum NetworkError : String, Error {
    case connectionErr = "An error occured while requesting to the server. It may be caused by internet connection."
}
