//
//  SocialMediaProfile.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import Foundation

public struct SocialMediaProfile: Identifiable {
    public var id: URL { url }
    public var url: URL
    public var icon: String
    
    public init(url: URL, icon: String) {
        self.url = url
        self.icon = icon
    }
}
