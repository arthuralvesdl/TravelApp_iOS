import SwiftUI

struct LoginView: View {
@StateObject private var loginModel = LoginModel()
    
    var body: some View {
        NavigationView{
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
                            .foregroundColor(Color.white)
                        Text("Seu app de viagens")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    LoginInputsView(loginModel: loginModel)
                    
                    VStack (spacing: 10) {
                        
                        NavigationLink(destination: HomeView(loginModel: loginModel),isActive: $loginModel.shouldLogin){}
                        Button("Entrar") {
                            loginModel.login()
                        }
                        .frame(width: 145, height: 40)
                        .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))).ignoresSafeArea()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: Text("Register"), isActive: $loginModel.shouldRegister){}
                        Button("Registrar"){
                        //TODO: tela de registro
                        }
                        .frame(width: 145, height: 40)
                        .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))).ignoresSafeArea()
                        .background(Color.white)
                        .cornerRadius(10)
                    }.padding(.top, 10)
                    Spacer()
                }
            }
        }
    }
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
