import SwiftUI

struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 200)
            .background(Color(UIColor.init(rgb: 0xff8da1)))
            .clipShape(Circle())
    }
}

struct NavigationButton: View {
    @State private var solutionViewIsOn = false
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: $solutionViewIsOn) {
                InterpolationSearchView()
            } label: {
                Button(action: {
                    solutionViewIsOn.toggle()
                }){
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.leading, 15)
                    
                }.buttonStyle(BlueButtonStyle())
            }

            
        }
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton()
    }
}
