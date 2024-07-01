import SwiftUI

struct SearchCategoryButton: View {
    let image: Image
    let name: String
    @Binding var optionSelected: String
    
    var body: some View {
        
        Button("\(image)  \(name)") {
            self.optionSelected = name
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .foregroundColor(isSelected() ? Color.white : Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
        .background(!isSelected() ? Color.white : Color(CGColor(red: 58 / 255, green: 166 / 255, blue: 200 / 255, alpha: 1)))
        .cornerRadius(20)
    }
    
    func isSelected() -> Bool {
        if optionSelected == name {
            return true
        } else {
            return false
        }
    }
}
