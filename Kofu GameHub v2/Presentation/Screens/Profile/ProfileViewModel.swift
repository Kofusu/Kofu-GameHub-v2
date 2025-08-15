//
//  ProfileViewModel.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 10/08/25.
//

import Foundation
import Core

class ProfileViewModel: ObservableObject {
    let interest = ["UI/UX", "Frontend Engineering", "Machine Learning", "Web Development", "Mobile App Development", "3D"]
    
    let socialMedia = [
        SocialMediaProfile(
            url: URL(string:"https://www.linkedin.com/in/hendratara")!,
            icon: "pixel_linkedin"
        ),
        SocialMediaProfile(
            url: URL(string:"https://www.instagram.com/hendratara95")!,
            icon: "pixel_instagram"
        ),
        SocialMediaProfile(
            url: URL(string:"https://github.com/Kofusu")!,
            icon: "pixel_github"
        ),
        SocialMediaProfile(
            url: URL(string:"mailto: hendratara95@gmail.com")!,
            icon: "pixelarticons_mail"
        ),
    ]
}
