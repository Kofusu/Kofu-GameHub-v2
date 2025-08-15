//
//  TagRepositoryImpl.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation
import Core

final class TagRepositoryImpl: TagRepository {
    var client: TagAPIClient
    
    init(client: TagAPIClient = .init()) {
        self.client = client
    }
    
    func getTags(limit: Int? = 10, offset: Int? = 0) async throws -> [TagEntity] {
        let dtos = try await client.fetchTags(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }
}
