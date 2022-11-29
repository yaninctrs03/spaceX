//
//  missionRow.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 29/11/22.
//

import SwiftUI

struct MissionRow: View {
    @Binding var mission: MissionModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                AsyncImage(
                    url: URL(string: mission.links.mission_patch_small ?? K.defaultPatchURL),
                    content: { image in
                        image.resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(maxHeight: 100)
                    },
                    placeholder: {
                        ProgressView()
                    })
                Spacer()
                VStack{
                    Text(mission.launch_site.site_name)
                    Text(String(mission.launch_date_unix))
                }
            }
            Text(mission.rocket.rocket_name)
            Text(mission.mission_name)
        }.padding()
    }
}

struct missionRow_Previews: PreviewProvider {
    static private var mission = Binding.constant(Mission())
    static var previews: some View {
        MissionRow(mission: mission.mission)
    }
}
