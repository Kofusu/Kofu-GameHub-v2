//
//  Extension+Image.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

extension Image {
    func icon(_ size: CGFloat? = 24) -> some View {
        self
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
    }
}
