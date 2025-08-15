import Foundation
import Core

struct DetailGameDTO: Codable {
    let id: Int
    let slug: String
    let name: String
    let description: String?
    let released: Date?
    let backgroundImage: URL?
    let website: URL?
    let rating: Double
    let platforms: [GamePlatform]
    let tags: [DetailTag]?
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, description, released, website, rating, platforms, tags
        case backgroundImage = "background_image"

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        name = try container.decode(String.self, forKey: .name)
        rating = try container.decode(Double.self, forKey: .rating)
        platforms = try container.decode([GamePlatform].self, forKey: .platforms)
        tags = try container.decode([DetailTag].self, forKey: .tags)
        
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
            description: description,
            released: released,
            backgroundImage: backgroundImage,
            website: website,
            rating: rating,
            tags: tags?.map { $0.name }
        )
    }
}

struct DetailTag: Codable, Identifiable {
    let id: Int
    let name: String
}
