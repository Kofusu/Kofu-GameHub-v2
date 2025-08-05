//
//  DeveloperAPIClient.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 05/08/25.
//

import Foundation
import Alamofire

struct DeveloperAPIClient {
    func fetchDevelopers(limit: Int? = 10, offset: Int? = 0) async throws -> [Developer] {
        var urlComponent = URLComponents(string: "\(API_URL)/developers")
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "page_size", value: String(limit!)),
            URLQueryItem(name: "page", value: String(offset!)),
        ]
        
        guard let url = urlComponent?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DeveloperListResponse.self, from: data)
        
        return response.results.map { $0.toEntity() }
    }
}
