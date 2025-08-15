//
//  GetPopularGameUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 03/08/25.
//

import Foundation

public protocol GetPopularGameUseCase {
    func execute(limit: Int?, offset: Int?) async throws -> [Game]
}

public final class GetPopularGameUseCaseImpl: GetPopularGameUseCase {
    public let repository: GameRepository
    
    public init(repository: GameRepository) {
        self.repository = repository
    }
    
    public func execute(limit: Int? = 10, offset: Int? = 0) async throws -> [Game] {
        try await repository.getPopularGames(limit: limit, offset: offset)
    }
}
