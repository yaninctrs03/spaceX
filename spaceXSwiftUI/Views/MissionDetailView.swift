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
            BackgroundView()
            VStack{
                HeaderView()
                ContentView(mission: mission)
                Spacer()
            }
        }
    }
}

struct HeaderView: View{
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
#if !APPCLIP
        HStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                BackView()
            }
            Spacer()
        }
        .padding(.horizontal)
#else
        Spacer()
#endif
    }
}

struct ContentView: View{
    let mission: MissionModel
    var body: some View{
        HStack{
            InfoView(mission: mission)
            Spacer()
            ImageView(img: mission.links.mission_patch)
                .frame(width: 150)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct InfoView: View{
    let mission: MissionModel
    var body: some View{
        VStack(alignment: .leading, spacing: 15.0){
            TitleText(text: mission.mission_name)
            MissionTextRow(text: mission.details ?? "")
                .padding(.bottom)
            MissionData(title: "Rocket Name", subtitle: mission.rocket.rocket_name)
            MissionData(title: "Rocket Type", subtitle: mission.rocket.rocket_type)
            MissionData(title: "Launch Site", subtitle: mission.launch_site.site_name)
            MissionData(title: "Launch Date", subtitle: String(mission.launch_date_unix))
        }
    }
}

struct ImageView: View{
    let img: String?
    var body: some View{
        AsyncImage(
            url: URL(string: img ?? K.IMG.defaultPatchURL),
            content: { image in
                image
                    .resizable().scaledToFit()
                    .frame(width: 100)
                    .aspectRatio(1, contentMode: .fit)
                
            },
            placeholder: {
                ProgressView()
            })
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static private var mission = Binding.constant(Mission())
    static var previews: some View {
        MissionDetailView(mission: mission.mission)
    }
}
