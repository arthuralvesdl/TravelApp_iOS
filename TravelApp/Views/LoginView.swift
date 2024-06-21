import SwiftUI

struct LoginView: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var shouldLogin: Bool = false
    @State private var shouldRegister: Bool = false
    
    
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
                    
                    LoginInputsView(user: $user, password: $password)
                    
                    VStack (spacing: 10) {
                        
                        NavigationLink(destination: HomeView(),isActive: $shouldLogin){}
                        Button("Entrar") {
                            self.shouldLogin = true
                        }
                        .frame(width: 145, height: 40)
                        .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1))).ignoresSafeArea()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: Text("Register"), isActive: $shouldRegister){}
                        Button("Registrar"){
                            self.shouldRegister = true
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

struct LoginInputsView: View {
    @Binding var user: String
    @Binding var password: String
    var body: some View {
        VStack () {
            TextField("", text: $user).placeholder(when: user.isEmpty){
                Text("Usuário").foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
            }
            .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
            .padding(.top, 7)
            .padding(.bottom, 7)
            .padding(.leading, 10)
            .padding(.trailing, 5)
            .frame(width: 300)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.9)))
            .padding(.bottom,5)
            
            SecureField("", text: $user).placeholder(when: user.isEmpty){
                Text("Senha").foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
            }
            .foregroundColor(Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
            .padding(.top, 7)
            .padding(.bottom, 7)
            .padding(.leading, 10)
            .padding(.trailing, 5)
            .frame(width: 300)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.9)))
            .padding(.bottom,5)
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
