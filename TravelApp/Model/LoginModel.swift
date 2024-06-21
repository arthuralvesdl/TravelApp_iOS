import Foundation

class LoginModel: ObservableObject {
    @Published var user: String = ""
    @Published var password: String = ""
    @Published var shouldLogin: Bool = false
    @Published var shouldRegister: Bool = false
    
    func login () {
        //TODO: autenticacao de login
        shouldLogin = true
    }
}
