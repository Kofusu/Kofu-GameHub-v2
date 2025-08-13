//
//  DetailGameView.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import Foundation
import SwiftUI
import SwiftData
import Flow

struct DetailGameView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @StateObject var viewModel: DetailGameViewModel
    @Query private var likedGames: [LikedGame]
    
    // Computed property to check if current game is liked
    private var isLiked: Bool {
        likedGames.contains { $0.id == viewModel.id }
    }
    
    init(id: Int) {
        _viewModel = StateObject(wrappedValue: DetailGameViewModel(id: id,
                                                                   getDetailGameUseCase: GetDetailGameUseCaseImpl(
                                                                    repository: GameRepositoryImpl(
                                                                        client: GameAPIClient())
                                                                   )
                                                                  )
        )
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Color.darkBlue.ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 20) {
                    ZStack(alignment: .topLeading) {
                        if let img = viewModel.detailGame?.backgroundImage {
                            AsyncImage(url: img) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                case .failure:
                                    Image(systemName: "icloud.slash")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: geo.size.height * 0.3)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray)
                            }
                        } else {
                            Image(systemName: "icloud.slash")
                                .frame(maxWidth: .infinity, maxHeight: geo.size.height * 0.3)
                                .background {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(.gray)
                                }
                        }
                        
                        Button {
                            dismiss()
                        } label: {
                            Image("pixelarticons_arrow-left")
                                .icon()
                                .padding(.top, 10)
                                .padding(.leading, 16)
                        }
                        
                        Button {
                            toggleLikedGame()
                        } label: {
                            Image(isLiked ? "pixelarticons_heart-fill" : "pixelarticons_heart")
                                .icon(36)
                                .background {
                                    RoundedRectangle(cornerRadius: 1000)
                                        .fill(isLiked ? .red : .darkCyan)
                                        .frame(width: 64, height: 64, alignment: .center)
                                }
                        }
                        .offset(CGSize(width: geo.size.width - 72, height: geo.size.height * 0.3 - 16))
                    }
                    
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            VStack(alignment: .leading, spacing: 5) {
                                GameInfo(
                                    id: 1,
                                    name: viewModel.detailGame?.name ?? "-",
                                    rating: viewModel.detailGame?.rating ?? 0,
                                    released: viewModel.detailGame?.released,
                                    imageURL: viewModel.detailGame?.backgroundImage,
                                    disableNavigation: true)
                                
                                Text(viewModel.detailGame?.description ?? "-")
                                    .font(.customBody)
                            }
                            .container()
                            
                            if let gameTags = viewModel.detailGame?.tags {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Tags")
                                        .font(.customBody)
                                    
                                    HFlow(alignment: .top, spacing: 11) {
                                        ForEach(gameTags, id: \.self) { name in
                                            Text(name).UITag()
                                        }
                                    }
                                }
                                .container()
                            }
                        }
                    }
                }
            }
            .toolbar(.hidden)
            .foregroundStyle(.lightCyan)
            .task {
                await viewModel.loadData()
            }
        }
    }
    
    // MARK: - Private Methods
    private func toggleLikedGame() {
        guard let detailGame = viewModel.detailGame else { return }
        
        if isLiked {
            // Remove from liked games
            if let existingGame = likedGames.first(where: { $0.id == viewModel.id }) {
                context.delete(existingGame)
            }
        } else {
            // Add to liked games
            let newLikedGame = LikedGame(
                id: detailGame.id,
                name: detailGame.name,
                imageBackground: detailGame.backgroundImage,
                released: detailGame.released,
                rating: detailGame.rating
            )
            context.insert(newLikedGame)
        }
        
        // Save changes
        do {
            try context.save()
        } catch {
            print("Error saving liked game: \(error)")
        }
    }
}

#Preview {
    DetailGameView(id: 1)
}
