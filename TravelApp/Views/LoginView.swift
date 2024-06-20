import SwiftUI

struct LoginView: View {
    @State private var user: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(CGColor(red: 25 / 255, green: 130 / 255, blue: 100 / 255, alpha: 1)).ignoresSafeArea()
                
                VStack (){
                    VStack(alignment: .center) {
                        Text("Travel")
                            .font(.title)
                            .foregroundStyle(.white)
                        Text("Seu app de viagens")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                    
                    LoginInputsView(user: $user, password: $password)
                    
                    Spacer()
                    VStack (spacing: 10) {
                        NavigationLink(destination: HomeView()){
                            Text("Entrar")
                                .foregroundColor(.black)
                        }
                        .frame(width: 110, height: 30)
                        .background(.white)
                        .cornerRadius(5)
                        
                        NavigationLink(destination: Text("Register")){
                            Text("Registrar")
                                .foregroundColor(.black)
                        }
                        .frame(width: 110, height: 30)
                        .background(.white)
                        .cornerRadius(5)
                    }.padding(.top, 10)
                }
            }
        }.navigationTitle("Travel")
    }
}

struct LoginInputsView: View {
    @Binding var user: String
    @Binding  var password: String
    var body: some View {
        VStack () {
            TextField("Usuário", text: $user)
                .foregroundStyle(.white)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
                .padding(.bottom,5)
            SecureField("Senha", text: $password)
                .foregroundStyle(.white)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.3)))
        }
    }
}

//#Preview {
//    LoginView()
//}
