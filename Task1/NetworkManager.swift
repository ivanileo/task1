//
//  NetworkManager.swift
//  Task1
//
//  Created by Ivan Suntsov on 9/12/23.
//

import Foundation

class NetworkManager {
    static func sendRequest(_ request:NetworkRequest, withCompletion completion:@escaping (SerializableModel?, Error?) -> Void) {
        guard var components = URLComponents(string: request.url) else { return }
        components.path = request.path
        if let query = request.query {
            var items = Array<URLQueryItem>()
            for key in query.keys {
                items .append(URLQueryItem(name: key, value: query[key]))
            }
            components.queryItems = items
        }
        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        if let body = request.body {
            urlRequest.httpBody = body
        }
        urlRequest.httpMethod = request.method.rawValue
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
                completion(nil, error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Error \(String(describing: response))")
                return
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let object = request.responseType.serialise(json: json)
                completion(object, nil)
            } catch {
                print("Error decoding JSON")
            }
            
        }
        task.resume()
    }
}

