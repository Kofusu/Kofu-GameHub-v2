//
//  DetailGameViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 12/08/25.
//

import Foundation
import SwiftData

final class DetailGameViewModel: ObservableObject {
    @Published var id: Int
    @Published var detailGame: DetailGame?
    
    @Published var isLoading: Bool = true
    @Published var isLiked: Bool = false
    
    private let getDetailGameUseCase: GetDetailGameUseCase
    
    var errorMessage: String?
    var context: ModelContext?
    
    init(id: Int, getDetailGameUseCase: GetDetailGameUseCase) {
        self.id = id
        self.getDetailGameUseCase = getDetailGameUseCase
    }
    
    func loadData() async {
        isLoading = true
        
        defer { isLoading = false }
        
        do {
            detailGame = try await getDetailGameUseCase.execute(id: id)
        } catch {
            errorMessage = error.localizedDescription
            print(errorMessage ?? "Unknown Error")
        }
    }
}
