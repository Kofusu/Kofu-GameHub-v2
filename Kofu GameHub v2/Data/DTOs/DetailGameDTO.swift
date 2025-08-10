import Foundation

struct DetailGameDTO: Codable {
    let id: Int
    let slug: String
    let name: String
    let nameOriginal: String
    let description: String?
    let released: Date?
    let tba: Bool
    let backgroundImage: URL?
    let backgroundImageAdditional: URL?
    let website: URL?
    let rating: Double
    let ratingTop: Int
    let ratingCount: Int
    let platforms: [GamePlatform]
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, description, released, tba, website, rating, platforms
        case nameOriginal = "name_original"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case ratingTop = "rating_top"
        case ratingCount = "rating_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        name = try container.decode(String.self, forKey: .name)
        nameOriginal = try container.decode(String.self, forKey: .nameOriginal)
        tba = try container.decode(Bool.self, forKey: .tba)
        rating = try container.decode(Double.self, forKey: .rating)
        ratingTop = try container.decode(Int.self, forKey: .ratingTop)
        ratingCount = try container.decode(Int.self, forKey: .ratingCount)
        platforms = try container.decode([GamePlatform].self, forKey: .platforms)
        
        description = try container.decodeIfPresent(String.self, forKey: .description)
        
        // Safe Date parse
        if let releasedString = try container.decodeIfPresent(String.self, forKey: .released) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            released = dateFormatter.date(from: releasedString)
        } else {
            released = nil
        }
        
        // Safe URL parse
        if let backgroundImageString = try container.decodeIfPresent(String.self, forKey: .backgroundImage) {
            backgroundImage = URL(string: backgroundImageString)
        } else {
            backgroundImage = nil
        }
        
        if let backgroundImageAdditionalString = try container.decodeIfPresent(String.self, forKey: .backgroundImageAdditional) {
            backgroundImageAdditional = URL(string: backgroundImageAdditionalString)
        } else {
            backgroundImageAdditional = nil
        }
        
        if let websiteString = try container.decodeIfPresent(String.self, forKey: .website) {
            website = URL(string: websiteString)
        } else {
            website = nil
        }
    }
    
    func toEntity() -> DetailGame {
        DetailGame(
            id: id,
            name: name,
            nameOriginal: nameOriginal,
            description: description,
            released: released,
            backgroundImage: backgroundImage,
            backgroundImageAdditional: backgroundImageAdditional,
            website: website,
            rating: rating,
        )
    }
}
