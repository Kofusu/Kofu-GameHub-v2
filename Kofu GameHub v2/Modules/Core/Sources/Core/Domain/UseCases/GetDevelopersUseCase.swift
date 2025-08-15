//
//  GetTopFiveDevelopers.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation

public protocol GetDevelopersUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [Developer]
}

public final class GetDevelopersUseCaseImpl: GetDevelopersUseCase {
    public var repository: DeveloperRepository
    
    public init(repository: DeveloperRepository) {
        self.repository = repository
    }
    
    public func execute(limit: Int? = 5, offset: Int? = 0) async throws -> [Developer] {
        try await repository.getDevelopers(limit: limit, offset: offset)
    }
}
