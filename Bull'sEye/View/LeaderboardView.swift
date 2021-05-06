//
//  LeaderboardView.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 06/06/1442 AH.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    @Binding var leaderboardIsShowing: Bool
    var body: some View {
        ScrollView(content: {
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 10){
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    LabelView()
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        })
        
        
        
    }
}

struct RowView: View {
    var index: Int
    var score: Int
    var date: Date
    var body: some View {
        
        
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            
            DateText(date: date)
                .frame(width: Constants.Leaderboard.DateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: 56.0)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
        
        
        
        
    }
}
struct HeaderView: View {
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack{
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    
                    BigBoldText(text: "leaderboard")
                        .padding()
                    Spacer()
                }else{
                    BigBoldText(text: "leaderboard")
                    
                }
            }
            
            HStack{
                Spacer()
                Button(action: {
                    //close
                    leaderboardIsShowing = false
                }, label: {
                    RoundedViewFilled(systemName: "xmark")
                        .padding()
                })
                
            }
        }
        
    }
}

struct LabelView: View {
    var body: some View {
        
        
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.DateColWidth)
            
        }.padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
        
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Game(loadTestData: true)
    static var previews: some View {
        Group {
            
            LeaderboardView(game: .constant(game),leaderboardIsShowing: leaderboardIsShowing)
            LeaderboardView(game: .constant(game),leaderboardIsShowing: leaderboardIsShowing)
                .previewLayout(.fixed(width: 568, height: 320))
            
        }
        
        Group {
            LeaderboardView(game: .constant(game),leaderboardIsShowing: leaderboardIsShowing)
            
            LeaderboardView(game: .constant(game),leaderboardIsShowing: leaderboardIsShowing)
                .previewLayout(.fixed(width: 568, height: 320))
        } .preferredColorScheme(.dark)
    }
}
