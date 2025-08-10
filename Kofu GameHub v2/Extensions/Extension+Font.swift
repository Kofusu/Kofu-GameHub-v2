//
//  Extension+Font.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 07/08/25.
//

import Foundation
import SwiftUI

extension Font {
    // Custom Font
    static var customHeading: Font {
        .custom("VT323-Regular", size: 20, relativeTo: .title)
    }
    
    static var customBody: Font {
        .custom("VT323-Regular", size: 17, relativeTo: .body)
    }
    
    static var customCaption: Font {
        .custom("VT323-Regular", size: 14, relativeTo: .caption)
    }
}
