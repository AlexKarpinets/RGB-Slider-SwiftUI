//
//  ContentView.swift
//  RGB Slider SwiftUI
//
//  Created by Karpinets Alexander on 10.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSliderValue = Double.random(in: 0...255)
    @State var greenSliderValue = Double.random(in: 0...255)
    @State var blueSliderValue = Double.random(in: 0...255)
    
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
                Color(
                    red: redSliderValue /  255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255)
                    .frame(width: 350, height: 170)
                    .cornerRadius(85)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 3))
                
                VStack {
                    RedSlider(value: $redSliderValue,
                              alert: $alertPresented)
                    GreenSlider(value: $greenSliderValue,
                                alert: $alertPresented)
                    BlueSlider(value: $blueSliderValue,
                               alert: $alertPresented)
                }
                .padding(.top)
                Spacer()
            }
            .padding()
        }
    }
    
    //    private func checkTextfield() {
    // }
    //
    //    private func getAlert() -> Alert {
    //            return Alert(title: Text("Wrong Format!"),
    //                         message: Text("Please enter number"))
    //        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RedSlider: View {
    @Binding var value: Double
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.red)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(.red)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.red)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"),
                          message: Text("Please enter number"))
                }
        }
    }
}

struct GreenSlider: View {
    @Binding var value: Double
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.green)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(.green)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.green)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"),
                          message: Text("Please enter number"))
                }
        }
    }
}

struct BlueSlider: View {
    @Binding var value: Double
    @Binding var alert: Bool
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.blue)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("0", value: $value, formatter: NumberFormatter())
                .border()
                .foregroundColor(.blue)
                .alert(isPresented: $alert) {
                    Alert(title: Text("Wrong Format!"),
                          message: Text("Please enter number"))
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
