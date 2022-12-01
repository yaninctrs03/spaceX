//
//  RoundedViews.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 29/11/22.
//

import SwiftUI

struct DateView: View {
    var date: Date
    var body: some View {
        Text(date, format:
                Date.FormatStyle()
                    .month(.abbreviated)
                    .day())
            .fontWeight(.semibold)
            .foregroundColor(Color.secondaryText)
            .kerning(1.0)
            .bold()
            .font(.caption)
            .multilineTextAlignment(.center)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(
                RoundedRectangle(cornerRadius: K.UI.tagCornerRadius)
                    .fill(Color.tagBackground))
    }
}

struct BackView: View {
    var body: some View {
        Image(systemName: K.UI.backButton)
            .font(.title)
            .frame(width: 50, height: 50)
            .foregroundColor(Color.mainText)
            .background(RoundedRectangle(cornerRadius: K.UI.cornerRadius).fill(Color.cardBackground))
            
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DateView(date: Date())
            BackView()
        }
    }
}
