//
//  SearchGameUseCase.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 04/08/25.
//

import Foundation


protocol SearchGameUseCase {
    func execute(query: String) async throws -> [Game]
}


final class SearchGameUseCaseImpl: SearchGameUseCase {
    var repository: GameRepository
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> [Game] {
        try await repository.searchGames(query: query)
    }
}
