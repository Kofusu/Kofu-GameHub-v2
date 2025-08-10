//
//  TagRepositoryImpl.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation

final class TagRepositoryImpl: DeveloperRepository {
    var client: TagAPIClient
    
    init(client: TagAPIClient = .init()) {
        self.client = client
    }
    
    func getDevelopers(limit: Int? = 10, offset: Int? = 0) async throws -> [Developer] {
        let dtos = try await client.fetchTags(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }
}
