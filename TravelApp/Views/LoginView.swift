import SwiftUI

struct LoginView: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var shouldLogin: Bool = false
    @State private var shouldRegister: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(1)
                
                VStack (){
                    VStack(alignment: .center) {
                        Text("Travel")
                            .font(.title)
                            .foregroundStyle(.white)
                        Text("Seu app de viagens")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity)
                    Spacer()
                    
                    LoginInputsView(user: $user, password: $password)
                    
                    HStack (spacing: 10) {
                        Button(action: {
                            shouldRegister = true
                        }) {
                            Text("Registrar")
                                .frame(width: 145, height: 30)
                                .background(Color.white).ignoresSafeArea()
                                .foregroundColor(.black)
                                .cornerRadius(5)
                        }
                        
                        Button(action: {
                            //validacao de login
                            shouldLogin = true
                        }) {
                            Text("Entrar")
                                .frame(width: 145, height: 30)
                                .background(Color.white).ignoresSafeArea()
                                .foregroundColor(.black)
                                .cornerRadius(5)
                        }
                 
                    }.padding(.top, 10)
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $shouldLogin) {
                HomeView()
            }
            .navigationDestination(isPresented: $shouldRegister) {
                //tela de cadastro
                Text("Register")
            }
        }
        .navigationTitle("Travel")
    }
}

struct LoginInputsView: View {
    @Binding var user: String
    @Binding var password: String
    var body: some View {
        VStack () {
            TextField("Usuário", text: $user)
                .foregroundStyle(.black)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                .padding(.bottom,5)
            SecureField("Senha", text: $password)
                .foregroundStyle(.black)
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
        }
    }
}
