//
//  TextViews.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 29/11/22.
//

import SwiftUI

struct TitleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.mainText)
            .multilineTextAlignment(.leading)
    }
}

struct MissionTextRow: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color.mainText)
    }
}

struct RocketTextRow: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(Color.secondaryText)
    }
}

struct LaunchTextRow: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(Color.secondaryText)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TitleText(text: "Launches")
            MissionTextRow(text: "STP-2")
            RocketTextRow(text: "Falcon Heavy")
            
        }
    }
}
