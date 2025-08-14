//
//  SearchGameViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 13/08/25.
//

import Foundation
import Combine

@MainActor
final class SearchGameViewModel: ObservableObject {
    @Published var searchtext: String = ""
    @Published var games: [Game] = []
    
    @Published var isLoading = true
    @Published var errorMessage: String = ""
    
    var cancellables = Set<AnyCancellable>()
    
    private var searchGameUseCase: SearchGameUseCaseImpl
    
    init (searchGameUseCase: SearchGameUseCaseImpl){
        self.searchGameUseCase = searchGameUseCase
        
        setupBinding()
    }
    
    func setupBinding() {
        $searchtext
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self else { return }
                
                guard !query.isEmpty else {
                    self.games = []
                    return
                }
                
                Task {
                    await self.loadData(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    func loadData(query: String) async {
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            games = try await searchGameUseCase.execute(query: query)
        } catch {
            errorMessage = error.localizedDescription
            print(errorMessage)
        }
    }
}
