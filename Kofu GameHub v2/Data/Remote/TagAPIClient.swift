//
//  TagAPIClient.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation

struct TagAPIClient {
    func fetchTags(limit: Int? = 10, offset: Int? = 0) async throws -> [TagDTO] {
        var urlComponent = URLComponents(string: "\(API_URL)tags")
        urlComponent?.queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "page_size", value: String(limit!)),
            URLQueryItem(name: "page", value: String((offset ?? 0) + 1)),
        ]
        
        guard let url = urlComponent?.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TagListResponse.self, from: data)
        
        return response.results
    }
}

