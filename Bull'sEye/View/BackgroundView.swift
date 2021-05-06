//
//  BackgroundView.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 02/06/1442 AH.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    var body: some View {
        
        VStack{
            topView(game: $game)
            Spacer()
            bottomView(game: $game)
        }
        .padding()
        .background(
            
            ZStack{
                RingsView()
                
                if alertIsVisible{
                   Color("ScreenColor")
                    .edgesIgnoringSafeArea(.all)
                }
            }
        
        )
        
        
    }
}

struct topView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    var body: some View {
        
        HStack{
            Button(action: {
                game.startOver()
            }, label: {
                RoundedViewStroked(systemName: "arrow.counterclockwise")
            })
            
            Spacer()
            
            Button(action: {
                leaderboardIsShowing = true
            }, label: {
                RoundedViewFilled(systemName: "list.dash")
            }).sheet(isPresented: $leaderboardIsShowing, content: {
                LeaderboardView(game: $game,leaderboardIsShowing: $leaderboardIsShowing)
            })
            
        }
        
    }
}


struct bottomView: View {
    @Binding var game: Game
    var body: some View {
        
        HStack{
            NumberView(title: "score", text: String(game.score))
            Spacer()
            NumberView(title: "round", text: String(game.round))
            
        }
        
    }
}

struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title)
            RoundRectTextView(text: text)
                .animation(.easeOut)
            
        }
    }
}


struct RingsView: View {
    
    @Environment (\.colorScheme) var colorScheme
    

    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            let opacity = colorScheme == .dark ? 0.1 : 0.3
            ForEach(1..<6) { ring in
                
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.8*opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
                    )
                    
                    .frame(width: CGFloat(ring)*100, height: CGFloat(ring)*100)
                
            }

        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()),alertIsVisible: .constant(false))
        NumberView(title: "score", text:"999")
        RingsView()
        RingsView()
            .preferredColorScheme(.dark)
    }
}
