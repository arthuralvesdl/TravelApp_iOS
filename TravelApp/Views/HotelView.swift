import SwiftUI

struct HotelView: View {
    @StateObject private var searchModel = SearchModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(searchModel.hotels) { hotel in
                ZStack (alignment: .bottom){
                    Image(hotel.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                if let index = searchModel.hotels.firstIndex(where: { $0.id == hotel.id }) {
                                    searchModel.hotels[index].isFavorite.toggle()
                                }
                            }) {
                                Image(systemName: hotel.isFavorite ? "heart.fill" : "heart")
                                    .aspectRatio(contentMode: .fit)
                                    .padding(10)
                                    .background(Color.white.opacity(0.9))
                                    .clipShape(Circle())
                                    .padding([.top, .trailing], 10)
                                    .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
                            }
                        }
                        Spacer()
                    }
                    
                    ZStack (alignment:.leading){
                        Color.white.opacity(0.8)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        HStack {
                            VStack(alignment:.leading) {
                                Text(hotel.name)
                                    .font(.system(size: 20, weight: .heavy))
                                Text(hotel.location)
                                    .font(.system(size: 16))
                                HStack {
                                    Image(systemName: "star")
                                        .aspectRatio(contentMode: .fit)
                                    Text(String(format: "%.1f", hotel.rating))
                                        .font(.system(size: 16))
                                }
                            }
                            Spacer()
                            VStack (alignment:.trailing) {
                                Spacer()
                                HStack {
                                    Image(systemName: "mappin")
                                        .aspectRatio(contentMode: .fit)
                                    Text(hotel.distance)
                                        .font(.system(size: 16))
                                }
                                HStack {
                                    Image(systemName: "dollarsign.circle")
                                    Text(hotel.price)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                        }
                        .padding( 10)
                    }
                    .padding(10)
                    .frame(height: 100)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 20)
            }
            .onAppear {
                searchModel.loadHotels(searchValue: searchModel.searchValue)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HotelView()
}
