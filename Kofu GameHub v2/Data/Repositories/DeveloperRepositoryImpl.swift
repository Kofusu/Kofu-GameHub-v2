//
//  DeveloperRepositoryImpl.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 05/08/25.
//

import Foundation
import Core

final class DeveloperRepositoryImpl: DeveloperRepository {
    var client: DeveloperAPIClient
    
    init(client: DeveloperAPIClient = .init()) {
        self.client = client
    }
    
    func getDevelopers(limit: Int? = 10, offset: Int? = 0) async throws -> [Developer] {
        let dtos = try await client.fetchDevelopers(limit: limit, offset: offset)
        return dtos.map { $0.toEntity() }
    }
}
