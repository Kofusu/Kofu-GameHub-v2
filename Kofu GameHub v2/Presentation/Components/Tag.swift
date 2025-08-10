//
//  Tag.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

struct Tag: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.customBody)
            .foregroundStyle(.lightCyan)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 14)
                    .fill(.darkCyan)
            }
    }
}
