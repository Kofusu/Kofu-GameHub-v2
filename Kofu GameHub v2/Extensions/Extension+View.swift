//
//  View+Extension.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

extension View {
    func container(_ padding: CGFloat? = 16) -> some View {
        self.padding(.horizontal, padding)
    }
}
