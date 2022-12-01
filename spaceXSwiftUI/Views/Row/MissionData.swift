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
                MissionTextRow(text: title)
                MissionTextRow(text: subtitle)
            }
        }
    }
}

struct MissionData_Previews: PreviewProvider {
    static var previews: some View {
        MissionData(title: "Rocket Name", subtitle: "Falcon 9")
    }
}
