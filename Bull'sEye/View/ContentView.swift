//
//  ContentView.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 30/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        
        
        ZStack {
            
            BackgroundView(game: $game,alertIsVisible: $alertIsVisible)
            
            VStack{
                
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                
                if alertIsVisible{
                    PointsView(sliderValue: $sliderValue, game: $game,alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                }else{
                    HitMeButton(text: "Hit me", sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)

                }
            }
            if !alertIsVisible{
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale )
            }
        }
    }
}


struct InstructionView: View {
    @Binding var game: Game
    
    var body: some View {
        
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the bullsye as close as you can to")
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    //     var minValue: Int
    //     var maxValue: Int
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            
            SliderLabelText(text: String(1))
            Slider(value: $sliderValue  , in: 1...100)
            SliderLabelText(text: String(100))
            
            
        }
        .padding()
    }
    
    
}


struct HitMeButton: View {
    var text: String
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        Button(action: {
            withAnimation{
                alertIsVisible = true

            }
        }) {//what's inside the button
            Text(text.uppercased())
        }
        .padding(20.0)
        .background(
            
            Color("ButtonColor")
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3),Color.clear]), startPoint: .top, endPoint: .bottom)
                )
            
            
        )
        .foregroundColor(.white)
        .cornerRadius(Constants.General.roundRectViewCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        
        )
        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
            
        }
        Group {
            
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
            
            
        } .preferredColorScheme(.dark)
        
    }
}
