import SwiftUI

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}


struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.init(rgb: 0xffc0cb))
                    .ignoresSafeArea()
                VStack{
                    Text("Interpolation search \n Algorithm")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 43, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 100)
                        .padding(.horizontal, 20)
                    
                    NavigationButton()
                    
                }.padding(.top, -200)
                VStack {
                    Spacer()
                    Text("Made by \n Ksenia Kolpakova")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                
            }
            
            
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
