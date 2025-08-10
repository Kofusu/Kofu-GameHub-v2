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
        VStack(alignment: .leading, spacing: 8) {
            if let img = image {
                ProgressView()
                    .frame(width: 80, height: 80)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            } else {
                Image(systemName: "icloud.slash")
                    .frame(width: 80, height: 80)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.gray)
                    }
            }
            
            Text(title)
                .font(.customBody)
            
        }
    }
}
