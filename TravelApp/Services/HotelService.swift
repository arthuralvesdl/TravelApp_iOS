import Foundation

class HotelService {
    func fetchHotels(searchValue: String) -> [HotelModel] {
        return [
            HotelModel(name: "Hotel Paradise", imageName: "Hotel1", location:"Rio de Janeiro",rating: 4.6,distance:"441km", price:"120/noite",isFavorite: false, isRecommended: true),
            HotelModel(name: "Noble Oasis", imageName: "Hotel2",location:"Espírito Santo",rating: 4.8,distance:"632km", price:"110/noite",isFavorite: true, isRecommended: false),
            HotelModel(name: "Beachside Resort", imageName: "Hotel3",location:"Belém",rating: 5.0,distance:"2634km", price:"140/noite", isFavorite: false,  isRecommended: true),
            ]
    }
}
