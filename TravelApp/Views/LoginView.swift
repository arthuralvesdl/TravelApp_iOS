import SwiftUI

struct LoginView: View {
    @StateObject private var loginModel = LoginModel()
    @State private var showRegister: Bool = false
    var body: some View {
        NavigationView{
            ZStack {
                Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)).ignoresSafeArea()
                
                Image("IconImage")
                    .resizable()
                    .scaledToFit()
                    .opacity(1)
                    .padding(100)
                Spacer()
                
                VStack {
                    VStack(alignment: .center) {
                        Text("Travel")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                        Text("Seu app de viagens")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity)
              
                    Spacer()
                    
                    VStack (spacing: 5) {
//                        LoginInputsView(loginModel: loginModel)
                        NavigationLink(destination: HomeView(loginModel: loginModel), isActive: $loginModel.shouldLogin) {}
                        HStack {
                            Button(action: {
                                loginModel.login()
                            }) {
                                Text("Entrar")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                    .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
                                    .background(Color.white)
                                    .cornerRadius(7)
                                    .padding(.horizontal, 40)
                            }
                        }
                    }
                    
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Text("Não tem uma conta?")
                            .foregroundColor(Color.white.opacity(0.8))
                        NavigationLink(destination: Text("Register"), isActive: $loginModel.shouldRegister){}
                        Button(action: {
                            showRegister = true
                        }) {
                            Text("Registrar")
                                .frame(width: 100, height: 40)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }.sheet(isPresented: $showRegister, content: {
                            
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
