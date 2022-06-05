import SwiftUI

struct InterpolationSearchView: View {
    @State var arrayOfElements = ""
    @State var elementToFind = ""
    @State var indexOfElement = ""
    @State var placeHolder = "index"
    @FocusState private var stringIsFocused: Bool
    var body: some View {
        ZStack {
            Color(UIColor.init(rgb: 0xffc0cb))
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    TextField("separated by comma", text: $arrayOfElements)
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .focused($stringIsFocused)
                        .frame(alignment: .leading)
                        .padding()
                    
                    
                    
                    TextField("element to find", text: $elementToFind)
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .focused($stringIsFocused)
                        .frame(alignment: .leading)
                        .padding()
                }
                Spacer()
                VStack {
                    
                    TextField(placeHolder, text: $indexOfElement)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .padding(.bottom, 90)
                        .disabled(true)
                    
                    
                    Button(action: {
                        if arrayOfElements == "" || elementToFind == "" {
                            placeHolder = "type something"
                        } else {
                            let digits = arrayOfElements.components(separatedBy: ", ")
                            let intArray = digits.compactMap { Int($0) }
                            let elementToFind: Int = Int(elementToFind) ?? -1
                            
                            let answer = self.interpolationSearch(array: intArray, elementToFind: elementToFind)
                            
                            if answer == -1 {
                                placeHolder = "does not contain"
                                indexOfElement = ""
                            } else {
                                indexOfElement = String(answer)
                            }
                        }
                        
                        
                        
                        stringIsFocused = false
                    }) {
                        Text("Find")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold))
                    .padding()
                    .background(Color(UIColor.init(rgb: 0xff8da1)))
                    .cornerRadius(45)
                }
                Spacer()
            }
            .padding(.top, -50)
        }
        
        
    }
    
    func interpolationSearch(array: Array<Int>, elementToFind: Int) -> Int {
        var mid: Int
        var left = 0
        var right = array.count - 1
        
        while array[left] <= elementToFind && array[right] >= elementToFind {
            mid = left + ((elementToFind - array[left]) * (right - left)) / (array[right] - array[left])
            
            print(mid)
            
            if array[mid] < elementToFind {
                left = mid + 1
            } else if array[mid] > elementToFind {
                right = mid - 1
            } else {
                return mid
            }
        }
        
        if array[left] == elementToFind {
            return left
        } else {
            return -1
        }
    }
}

struct InterpolationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        InterpolationSearchView()
    }
}
