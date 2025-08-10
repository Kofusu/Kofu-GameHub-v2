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
                    if let _ = image {
                        ProgressView()
                            .frame(width: 162, height: 102)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray)
                            }
                    } else {
                        Image(systemName: "icloud.slash")
                            .frame(width: 165, height: 102)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray)
                            }
                    }
                    HStack(spacing: 4) {
                        Text(String(rating))
                            .font(.customCaption)
                        Image("pixel_star-solid")
                            .icon(11)
                    }
                    .padding(.top, 4)
                    .padding(.trailing, 6)
                }
                
                Text(name)
                    .font(.customBody)
            }
        }
    }
}
