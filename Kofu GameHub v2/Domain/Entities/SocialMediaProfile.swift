//
//  SocialMediaProfile.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import Foundation

struct SocialMediaProfile: Identifiable {
    var id: URL { url }
    var url: URL
    var icon: String
}
