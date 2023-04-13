//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by mac on 12.04.2023.
//

import Foundation

final class NetworkManager<T: Codable> {
  static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else {
        completion(.failure(.error(error: error?.localizedDescription ?? "Unknown network error")))
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }
      
      do {
        let json = try JSONDecoder().decode(T.self, from: data)
        completion(.success(json))
        
      } catch let decodingError {
        completion(.failure(.decodingError(error: decodingError.localizedDescription)))
      }
      
    }.resume()
  }
}

enum NetworkError: Error {
  case invalidResponse
  case invalidData
  case error(error: String) // associated value of String value
  case decodingError(error: String)
}
