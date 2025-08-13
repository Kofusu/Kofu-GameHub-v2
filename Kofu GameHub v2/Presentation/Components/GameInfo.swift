//
//  GameInfo.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation
import SwiftUI

struct GameInfo: View {
    let id: Int
    let name: String
    let rating: Double
    let released: Date?
    let imageURL: URL?
    
    var disableNavigation: Bool? = false
    
    var body: some View {
        if (disableNavigation!) {
            content
        } else {
            NavigationLink {
                DetailGameView(id: id)
            } label: {
                content
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        HStack {
                if let img = imageURL {
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
                    .frame(width: 119, height: 67)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                } else {
                    ProgressView()
                        .frame(width: 119, height: 67)
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray)
                        }
                }
           
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name).font(.customHeading)
                    .lineLimit(1)
                Text("Rating: \(String(rating))").font(.customBody)
                if let released {
                    Text("Released: \(released.formatDate())")
                        .font(.customBody)
                } else {
                    Text("Released: -")
                        .font(.customBody)
                }
            }
            
            Spacer()
        }
    }
}
