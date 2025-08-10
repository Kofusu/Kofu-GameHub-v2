//
//  Extension+Date.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 11/08/25.
//

import Foundation

extension Date {
    /// Format Date → String dengan format custom
    func formatDate(_ format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
