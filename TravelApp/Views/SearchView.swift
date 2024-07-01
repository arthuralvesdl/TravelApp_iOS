import SwiftUI

struct SearchView: View {
    @State var optionSelected: String = "Hotel"
    @StateObject private var searchModel = SearchModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Pesquisar", text: $searchModel.searchValue)
                        .autocorrectionDisabled(true)
                }
                .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).opacity(0.3).foregroundColor(Color.black))
                .padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        SearchCategoryButton(image: Image(systemName: "building"), name: "Hotel", optionSelected: $optionSelected )
                        SearchCategoryButton(image: Image(systemName: "airplane"), name: "Voos", optionSelected: $optionSelected)
                        SearchCategoryButton(image: Image(systemName: "fork.knife"), name: "Restaurantes", optionSelected: $optionSelected)
                    }
                    .padding(10)
                }
                if optionSelected == "Hotel" {
                    HotelView()
                } else {
                    //TODO: outras telas
                    Text(optionSelected)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SearchView(optionSelected: "Hotel")
}
