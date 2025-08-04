//
//  Item.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import Foundation
import SwiftData

@Model
final class LikedGame {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
