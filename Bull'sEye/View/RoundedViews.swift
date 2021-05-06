//
//  RoundedViews.swift
//  myAppSwiftUI
//
//  Created by Nadia Seleem on 28/05/1442 AH.
//

import SwiftUI

struct RoundedViewStroked: View {
    var systemName: String
    var body: some View {
        
        
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
        
    }
}

struct RoundedViewFilled: View {
    var systemName: String
    var body: some View {
        
        
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
        
        
        
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        ZStack{
            Text(text)
                .bold()
                .foregroundColor(Color("TextColor"))
                .font(.title3)
                .kerning(-0.2)
            
            
            RoundedRectangle(cornerRadius: Constants.General.roundRectViewCornerRadius)
                .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth  )
                .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            
        }
        
        
        
    }
}


struct RoundedTextView: View {
    let text: String

    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)

            .foregroundColor(Color("TextColor"))
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )

    }
    
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10){
            RoundedViewStroked(systemName: "list.dash")
            RoundedViewStroked(systemName: "arrow.counterclockwise")
            RoundedViewStroked(systemName: "xmark")

            RoundedViewFilled(systemName: "list.dash")
            RoundedViewFilled(systemName: "arrow.counterclockwise")
            RoundedViewFilled(systemName: "xmark")

            RoundRectTextView(text: "999")
            RoundedTextView(text: "1")

        }.padding()
        VStack(spacing: 10){
            RoundedViewStroked(systemName: "list.dash")
            RoundedViewStroked(systemName: "arrow.counterclockwise")
            RoundedViewStroked(systemName: "xmark")

            RoundedViewFilled(systemName: "list.dash")
            RoundedViewFilled(systemName: "arrow.counterclockwise")
            RoundedViewFilled(systemName: "xmark")

            RoundRectTextView(text: "999")
            RoundedTextView(text: "1")
        }.padding()
        .preferredColorScheme(.dark)
        
        
    }
}

