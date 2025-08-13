//
//  ListGameViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 12/08/25.
//

import Foundation

enum ListGameType {
    case popular
    case newest
}

final class ListGameViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    @Published var isLoading: Bool = true
    
    private let getNewestGameUseCase: GetNewestGameUseCase
    private let getPopularGameUseCase: GetPopularGameUseCase
    var listGameType: ListGameType
    
    var errorMessage: String?
    
    init(listGameType: ListGameType, getNewestGameUseCase: GetNewestGameUseCase, getPopularGameUseCase: GetPopularGameUseCase) {
        self.listGameType = listGameType
        self.getNewestGameUseCase = getNewestGameUseCase
        self.getPopularGameUseCase = getPopularGameUseCase
    }
    
    func loadData() async {
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            if listGameType == .newest {
                games = try await getNewestGameUseCase.execute(limit: 10, offset: 0)
            } else {
                games = try await getPopularGameUseCase.execute(limit: 10, offset: 0)
            }
        } catch {
            errorMessage = error.localizedDescription
            print(errorMessage ?? "Unknown Error")
        }
    }
}
