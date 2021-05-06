//
//  TextViews.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 28/05/1442 AH.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(2.0)
            .lineSpacing(4.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
            
    }
}


struct BigNumberText : View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
  
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 34.0)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.subheadline)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            ).cornerRadius(12)
    }
}



struct ScoreText: View {
    let score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
    }
    
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        
        Text(date, style: .time)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
    }
    
}

struct BigBoldText: View{
    var text: String
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        InstructionText(text: "Instruction")
        LabelText(text: "Score")
        BigNumberText(text: "999")
        SliderLabelText(text: "1")
        BodyText(text: "You Scored 200 Points\n🎉🎉🎉")
        ButtonText(text: "Start New Round")
        ScoreText(score: 459)
        DateText(date: Date())
        BigBoldText(text: "leaderboard")


        }.padding()

        VStack{
        InstructionText(text: "Instruction")
        LabelText(text: "Score")
        BigNumberText(text: "999")
        SliderLabelText(text: "1")
        BodyText(text: "You Scored 200 Points\n🎉🎉🎉")
        ButtonText(text: "Start New Round")
        ScoreText(score: 459)
            DateText(date: Date())
        BigBoldText(text: "leaderboard")
        }.padding()
        .preferredColorScheme(.dark)
    }
}
