import SwiftUI

struct HomeView: View {
    @ObservedObject var loginModel: LoginModel
    var body: some View {
        
        NavigationView {
            ZStack{
                TabView{
                    SearchView()
                        .tabItem(){
                            Image(systemName: "magnifyingglass").renderingMode(.template)
                            Text("Pesquisar")
                        }
                    ProfileView(loginModel:loginModel)
                        .tabItem(){
                            Image(systemName: "person.crop.circle").renderingMode(.template)
                            Text("Perfil")
                        }
                }.accentColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(loginModel: LoginModel())
}
