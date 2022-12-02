//
//  MissionData.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 30/11/22.
//

import SwiftUI

struct MissionData: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: 2, height: 50)
            
            VStack(alignment: .leading){
                TitleDetail(text: title)
                SubtitleDetail(text: subtitle)
            }
        }
    }
}

struct MissionDataDate: View {
    let title: String
    let date: Date
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: 2, height: 50)
            
            VStack(alignment: .leading){
                TitleDetail(text: title)
                //                SubtitleDetail(text: subtitle)
                Text(date, format:
                        Date.FormatStyle()
                    .month(.wide)
                    .day()
                    .year())
            }
        }
    }
}

struct MissionData_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            MissionData(title: "Rocket Name", subtitle: "Falcon 9")
            MissionDataDate(title: "Launch Date", date: Date())
        }
    }
}
