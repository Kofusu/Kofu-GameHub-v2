//
//  PlatformRepositoryImpl.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 05/08/25.
//

import Foundation

final class PlatformRepositoryImpl: PlatformRepository {
    var client: PlatformAPIClient
    
    init(client: PlatformAPIClient = .init()) {
        self.client = client
    }
    
    func getPlatforms(limit: Int? = 10, offset: Int? = 0) async throws -> [Platform] {
        let dtos = try await client.fetchPlatforms(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }

}
