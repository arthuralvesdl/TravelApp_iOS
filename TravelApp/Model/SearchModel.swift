import Foundation

class SearchModel: ObservableObject {
    @Published var searchValue: String = ""
    @Published var hotels: [HotelModel] = []
    private let hotelService = HotelService()
    
    func loadHotels(searchValue: String) {
        self.hotels = hotelService.fetchHotels(searchValue: searchValue)
    }
}

