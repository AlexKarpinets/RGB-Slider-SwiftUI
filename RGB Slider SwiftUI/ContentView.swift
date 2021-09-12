//
//  ContentView.swift
//  RGB Slider SwiftUI
//
//  Created by Karpinets Alexander on 10.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSliderValue: Double
    @State var greenSliderValue: Double
    @State var blueSliderValue: Double
    
    @State var redTextFieldText = ""
    @State var greenTextFieldText = ""
    @State var blueTextFieldText = ""
    
    @State private var alertPresented = false
    @State private var displayedNumber = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Color(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
                    .frame(width: 310, height: 150)
                    .cornerRadius(30)
                
                VStack {
                    RedSlider(value: $redSliderValue, text: $redTextFieldText, alert: $alertPresented)
                    GreenSlider(value: $greenSliderValue, text: $greenTextFieldText, alert: $alertPresented)
                    BlueSlider(value: $blueSliderValue, text: $blueTextFieldText, alert: $alertPresented)
                }
                .padding()
                Spacer()
            }
            .padding()
        }
    }
    
//    private func checkTextfield() {
//        if let _ = Double(redTextFieldText) {
//            redTextFieldText = ""
//            alertPresented.toggle()
//            return
//        }
//        redTextFieldText = ""
//}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(redSliderValue: 0, greenSliderValue: 0, blueSliderValue: 0)
    }
}

struct RedSlider: View {
    @Binding var value: Double
    @Binding var text: String
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.red)
            Slider(value: $value)
                .accentColor(.red)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.red)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"), message: Text("Please enter number"))
                }
        }
    }
}

struct GreenSlider: View {
    @Binding var value: Double
    @Binding var text: String
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.green)
            Slider(value: $value)
                .accentColor(.green)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.green)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"), message: Text("Please enter number"))
                }
        }
    }
}

struct BlueSlider: View {
    @Binding var value: Double
    @Binding var text: String
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.blue)
            Slider(value: $value)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.blue)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"), message: Text("Please enter number"))
                }
        }
    }
}

struct TextfieldBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.trailing)
            .frame(width: 50, height: 25)
            .background(Color.white)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
}

extension TextField {
    func border() -> some View {
        ModifiedContent(content: self, modifier: TextfieldBorder())
    }
}
