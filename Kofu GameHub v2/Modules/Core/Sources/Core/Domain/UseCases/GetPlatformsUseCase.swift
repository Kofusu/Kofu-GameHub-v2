//
//  GetPlatformsUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

public protocol GetPlatformsUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [Platform]
}

public final class GetPlatformsUseCaseImpl: GetPlatformsUseCase {
    public var repository: PlatformRepository
    
    public init(repository: PlatformRepository) {
        self.repository = repository
    }
    
    public func execute(limit: Int? = 10, offset: Int? = 0) async throws -> [Platform] {
        try await repository.getPlatforms(limit: limit, offset: offset)
    }
}
