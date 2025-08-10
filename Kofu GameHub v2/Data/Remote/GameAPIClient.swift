//
//  GameAPIClient.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 05/08/25.
//

import Foundation
import Alamofire

struct GameAPIClient {
    func fetchPopularGames(limit: Int? = 10, offset: Int? = 0) async throws -> [GameDTO] {
        var urlComponents = URLComponents(string: "\(API_URL)/games")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "ordering", value: "-rating"),
            URLQueryItem(name: "page_size", value: String(limit!)),
            URLQueryItem(name: "page", value: String((offset ?? 0) + 1)),
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GameListResponse.self, from: data)
        
        return response.results
    }
    
    func fetchNewestGames(limit: Int? = 10, offset: Int? = 0) async throws -> [GameDTO] {
        var urlComponents = URLComponents(string: "\(API_URL)/games")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "ordering", value: "-released"),
            URLQueryItem(name: "page_size", value: String(limit!)),
            URLQueryItem(name: "page", value: String((offset ?? 0) + 1)),
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GameListResponse.self, from: data)
        
        return response.results
    }
    
    func fetchSearchGames(query: String) async throws -> [GameDTO] {
        var urlComponents = URLComponents(string: "\(API_URL)/games")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "search_exact", value: query),
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(GameListResponse.self, from: data)
        
        return response.results
    }
    
    func fetchDetailGames(id: Int) async throws -> DetailGameDTO {
        var urlComponents = URLComponents(string: "\(API_URL)/games/\(id)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
        ]
        
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DetailGameDTO.self, from: data)
        
        return response
    }
}
