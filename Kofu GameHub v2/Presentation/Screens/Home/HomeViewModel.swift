//
//  HomeViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var tags: [TagEntity] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    
    private let getTagsUseCase: GetTagsUseCase
    
    init(getTagsUseCase: GetTagsUseCase) {
        self.getTagsUseCase = getTagsUseCase
    }
    
    func loadData() async {
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            tags = try await getTagsUseCase.execute(limit: 10, offset: 0)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
