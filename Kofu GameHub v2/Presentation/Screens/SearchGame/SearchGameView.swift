//
//  SearchView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import SwiftUI
import Core

struct SearchGameView: View {
    @StateObject var viewModel: SearchGameViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: SearchGameViewModel(
            searchGameUseCase: SearchGameUseCaseImpl(
                repository: GameRepositoryImpl(
                    client: GameAPIClient()
                )
            )
        )
        )
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.darkBlue.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                SearchHeaderApp(searchText: $viewModel.searchtext)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Search For: \(viewModel.searchtext)").font(.customBody)
                        Spacer()
                    }
                    
                    ScrollView {
                        LazyVStack(spacing: 32) {
                            ForEach(viewModel.games) { game in
                                GameInfo(
                                    id: game.id,
                                    name: game.name,
                                    rating: game.rating,
                                    released: game.released,
                                    imageURL: game.backgroundImage)
                            }
                        }
                    }
                }
                .container()
                .padding(.top, 14)
            }
            
            Spacer()
        }
        .toolbar(.hidden)
        .foregroundStyle(.lightCyan)
    }
}

#Preview {
    SearchGameView()
}
