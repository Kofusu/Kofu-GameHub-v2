//
//  HomeViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation
import Core

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var tags: [TagEntity] = []
    @Published var platforms: [Platform] = []
    @Published var developers: [Developer] = []
    @Published var popularGames: [Game] = []
    @Published var newestGames: [Game] = []
    
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    
    private let getTagsUseCase: GetTagsUseCase
    private let getDevelopersUseCase: GetDevelopersUseCase
    private let getPlatformUseCase: GetPlatformsUseCase
    private let getPopularGameUseCase: GetPopularGameUseCase
    private let getNewestGameUseCase: GetNewestGameUseCase
    
    init(getTagsUseCase: GetTagsUseCase,
         getDevelopersUseCase: GetDevelopersUseCase,
         getPlatformUseCase: GetPlatformsUseCase,
         getPopularGameUseCase: GetPopularGameUseCase,
         getNewestGameUseCase: GetNewestGameUseCase) {
        self.getTagsUseCase = getTagsUseCase
        self.getPlatformUseCase = getPlatformUseCase
        self.getDevelopersUseCase = getDevelopersUseCase
        self.getPopularGameUseCase = getPopularGameUseCase
        self.getNewestGameUseCase = getNewestGameUseCase
    }
    
    func loadData() async {
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            tags = try await getTagsUseCase.execute(limit: 10, offset: 0)
            developers = try await getDevelopersUseCase.execute(limit: 5, offset: 0)
            platforms = try await getPlatformUseCase.execute(limit: 10, offset: 0)
            popularGames = try await getPopularGameUseCase.execute(limit: 10, offset: 0)
            newestGames = try await getNewestGameUseCase.execute(limit: 10, offset: 0)
        } catch {
            errorMessage = error.localizedDescription
            print(errorMessage ?? "Unknown Error")
        }
    }
}
