//
//  GetTagsUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import Foundation

protocol GetTagsUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [TagEntity]
}

final class GetTagUseCaseImpl: GetTagsUseCase {
    var repository: TagRepository
    
    init(repository: TagRepository) {
        self.repository = repository
    }
    
    func execute(limit: Int? = 10, offset: Int? = 0) async throws -> [TagEntity] {
        try await repository.getTags(limit: limit, offset: offset)
    }
}
