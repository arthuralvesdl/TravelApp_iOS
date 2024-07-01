import Foundation

struct HotelModel: Identifiable, Decodable {
    var id = UUID()
    var name: String
    var imageName: String
    var location: String
    var rating: Double
    var distance: String
    var price: String
    var isFavorite: Bool
    var  isRecommended: Bool
}
