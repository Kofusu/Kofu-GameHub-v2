//
//  GetTopFiveDevelopers.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

protocol GetDevelopersUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [Developer]
}

final class GetDevelopersUseCaseImpl: GetDevelopersUseCase {
    var repository: DeveloperRepository
    
    init(repository: DeveloperRepository) {
        self.repository = repository
    }
    
    func execute(limit: Int? = 5, offset: Int? = 0) async throws -> [Developer] {
        try await repository.getDevelopers(limit: limit, offset: offset)
    }
}
