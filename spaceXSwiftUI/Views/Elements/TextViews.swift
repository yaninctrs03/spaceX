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

struct TitleMissionRow: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundColor(Color.mainText)
    }
}

struct SubtitleMissionRow: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(Color.secondaryText)
    }
}

struct DescriptionDetail: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.medium)
            .foregroundColor(Color.mainText)
    }
}

struct TitleDetail: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color.mainText)
    }
}

struct SubtitleDetail: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.regular)
            .foregroundColor(Color.mainText)
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TitleText(text: "Launches")
            TitleMissionRow(text: "STP-2")
            SubtitleMissionRow(text: "Falcon Heavy")
            DescriptionDetail(text: "sldfsdjfbsldkjbfsdjbgsjdbgsjdb;akhgireuglakdnaldiugrgbdvbladifgsjdfbgs")
            TitleDetail(text: "Rocket Name")
            SubtitleDetail(text: "Falcon Heavy")
        }
    }
}
