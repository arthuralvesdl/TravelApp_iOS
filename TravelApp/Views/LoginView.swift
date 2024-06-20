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
                            .font(.system(size: 40))
                            .foregroundStyle(Color.white)
                        Text("Seu app de viagens")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    LoginInputsView(user: $user, password: $password)
                    
                    VStack (spacing: 10) {
                        
                        Button(action: {
                            //validacao de login
                            shouldLogin = true
                        }) {
                            Text("Entrar")
                                .frame(width: 145, height: 40)
                                .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))).ignoresSafeArea()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        
                        
                        Button(action: {
                            shouldRegister = true
                        }) {
                            Text("Registrar")
                                .frame(width: 145, height: 40)
                                .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))).ignoresSafeArea()
                                .background(Color.white)
                                .cornerRadius(10)
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
            TextField("", text: $user, prompt: Text("Usuário").foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))))
                .foregroundStyle(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
                .padding(.top, 7)
                .padding(.bottom, 7)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.9)))
                .padding(.bottom,5)
            SecureField("", text: $password, prompt: Text("Senha").foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))))
                .foregroundStyle(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
                .padding(.top, 7)
                .padding(.bottom, 7)
                .padding(.leading, 10)
                .padding(.trailing, 5)
                .frame(width: 300)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.9)))
        }
    }
}
