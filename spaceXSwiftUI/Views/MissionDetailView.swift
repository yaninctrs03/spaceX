//
//  MissionDetailView.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 17/11/22.
//

import SwiftUI

struct MissionDetailView: View {
    @Binding var mission: MissionModel
    
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
                        url: URL(string: mission.links.mission_patch_small ?? K.defaultPatchURL),
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
                Text(mission.details ?? "")
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
    static private var mission = Binding.constant(Mission())
    static var previews: some View {
        MissionDetailView(mission: mission.mission)
    }
}
