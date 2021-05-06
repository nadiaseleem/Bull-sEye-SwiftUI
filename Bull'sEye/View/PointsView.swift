//
//  PointsView.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 03/06/1442 AH.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    var body: some View {
        let points = game.points(guess: Int(sliderValue))
      
            VStack(alignment: .center, spacing: 10){
                
                InstructionText(text: "The slider's value is")
                BigNumberText(text: String(Int(sliderValue.rounded())))
                BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
                Button(action: {
                    game.startNewRound(points: points)
                    withAnimation{
                        alertIsVisible = false
                    }
                }, label: {
                    ButtonText(text: "Start New Round")
                })
                
            }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectViewCornerRadius)
            .shadow(radius: 10,x: 5, y: 5 )
            }
    
        
    }


struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PointsView(sliderValue: .constant(99), game: .constant(Game()),alertIsVisible: .constant(true))
            PointsView(sliderValue: .constant(99), game: .constant(Game()),alertIsVisible: .constant(true))                .previewLayout(.fixed(width: 568, height: 320))
        }
        
        Group {
            PointsView(sliderValue: .constant(99), game: .constant(Game()),alertIsVisible: .constant(true))
            
            PointsView(sliderValue: .constant(99), game: .constant(Game()),alertIsVisible: .constant(true))                .previewLayout(.fixed(width: 568, height: 320))
            
            
        } .preferredColorScheme(.dark)
    }
}
