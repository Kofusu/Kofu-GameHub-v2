//
//  GameCard.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 08/08/25.
//

import SwiftUI

struct GameCard: View {
    let id: Int
    let name: String
    let image: URL?
    let rating: Double
    
    var body: some View {
        NavigationLink {
            DetailGameView(id: id)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .topTrailing) {
                    if let img = image {
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
                        .frame(width: 162, height: 102)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        ProgressView()
                            .frame(width: 162, height: 102)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray)
                            }
                    }
                    
                    HStack(spacing: 4) {
                        Text(String(rating))
                            .font(.customCaption)
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 1, y: 1)
                        
                        Image("pixel_star-solid")
                            .icon(11)
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 1, y: 1)
                    }
                    .padding(.top, 4)
                    .padding(.trailing, 6)
                }
                
                Text(name)
                    .font(.customBody)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: 162, alignment: .leading)
            }
        }
    }
}
