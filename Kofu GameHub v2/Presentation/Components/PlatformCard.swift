//
//  PlatformCard.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

struct PlatformCard: View {
    let image: URL?
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
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
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            }
            
            Text(title)
                .font(.customBody)
                .lineLimit(1)
                .truncationMode(.middle)
                .frame(maxWidth: 80)
            
        }
    }
}
