//
//  MissionDetailView.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 17/11/22.
//

import SwiftUI

struct MissionDetailView: View {
    var mission = Mission(mission_name: "DemoSat",
                          rocket: Rocket(rocket_id: "falcon1",
                                         rocket_name: "Falcon 1",
                                         rocket_type: "Merlin A"),
                          launch_site: LaunchSite(
                            site_id: "kwajalein_atoll",
                            site_name: "Kwajalein Atoll",
                            site_name_long: "Kwajalein Atoll Omelek Island"),
                          launch_date_unix: 1174439400,
                          links: Links(mission_patch: "https://images2.imgbox.com/be/e7/iNqsqVYM_o.png", mission_patch_small: "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png", flickr_images: [String]()),
                          details: "Successful first stage burn and transition to second stage, maximum altitude 289 km, Premature engine shutdown at T+7 min 30 s, Failed to reach orbit, Failed to recover first stage")
    var body: some View {
        ZStack {
            Image("starsBG")
                .resizable(resizingMode: .stretch)
            
            VStack(alignment: .leading, spacing: 5.0){
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text(mission.mission_name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("Rocket: \(mission.rocket.rocket_name)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("Dec 6, 2020")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    AsyncImage(
                        url: URL(string: mission.links.mission_patch_small!),
                        content: { image in
                            image.resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(maxHeight: 150)
                        },
                        placeholder: {
                            ProgressView()
                        })
                }
                Divider()
                    .frame(height: 50.0)
                Text("Rocket: \(mission.rocket.rocket_type)")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text(mission.launch_site.site_name_long)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                Text(mission.details!)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.top, 120.0)
            .padding(.horizontal)
            .frame(maxHeight: .infinity)
            .background(ZStack {
                LinearGradient(colors: [Color.black.opacity(0.3),Color.black],
                               startPoint: .top,
                               endPoint: .bottom)
            })
            

        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailView()
    }
}
