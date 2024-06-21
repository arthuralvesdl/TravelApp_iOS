import SwiftUI

struct LoginInputsView: View {
    @ObservedObject var loginModel: LoginModel

    var body: some View {
        VStack () {
            TextField("", text: $loginModel.user).placeholder(when: loginModel.user.isEmpty){
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
            
            SecureField("", text: $loginModel.password).placeholder(when: loginModel.password.isEmpty){
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
