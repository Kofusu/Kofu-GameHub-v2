//
//  GetPlatformsUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

protocol GetPlatformsUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [Platform]
}

final class GetPlatformUseCase: GetPlatformsUseCase {
    var repository: PlatformRepository
    
    init(repository: PlatformRepository) {
        self.repository = repository
    }
    
    func execute(limit: Int? = 10, offset: Int? = 0) async throws -> [Platform] {
        try await repository.getPlatforms(limit: limit, offset: offset)
    }
}
