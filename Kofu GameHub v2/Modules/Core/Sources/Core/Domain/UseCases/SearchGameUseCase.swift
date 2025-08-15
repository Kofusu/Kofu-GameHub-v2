//
//  SearchGameUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation


public protocol SearchGameUseCase {
    func execute(query: String) async throws -> [Game]
}


public final class SearchGameUseCaseImpl: SearchGameUseCase {
    public var repository: GameRepository
    
    public init(repository: GameRepository) {
        self.repository = repository
    }
    
    public func execute(query: String) async throws -> [Game] {
        try await repository.searchGames(query: query)
    }
}
