//
//  Extension+Text.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

extension Text {
    func UITag() -> some View {
        self.font(.customBody)
            .foregroundStyle(.lightCyan)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 14)
                    .fill(.darkCyan)
            }
    }
}
