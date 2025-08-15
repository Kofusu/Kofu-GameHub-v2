//
//  GetTagsUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation

public protocol GetTagsUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [TagEntity]
}

public final class GetTagUseCaseImpl: GetTagsUseCase {
    public var repository: TagRepository
    
    public init(repository: TagRepository) {
        self.repository = repository
    }
    
    public func execute(limit: Int? = 10, offset: Int? = 0) async throws -> [TagEntity] {
        try await repository.getTags(limit: limit, offset: offset)
    }
}
