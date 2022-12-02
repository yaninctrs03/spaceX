//
//  missionRow.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 29/11/22.
//

import SwiftUI

struct MissionRow: View {
    @Binding var mission: MissionModel
    @State var detailIsVisible: Bool
    
    var body: some View {
        VStack {
            ImageRowView(img: mission.links.flickr_images.first)
                .overlay(
                    VStack {
                        Spacer()
                        DataRowView(mission: mission)
                    })
            .cornerRadius(K.UI.cornerRadius)
            Spacer()
                .frame(height: 15.0)
        }
        .onTapGesture {
            detailIsVisible.toggle()
        }
        .fullScreenCover(isPresented: $detailIsVisible, content: {
            MissionDetailView(mission: $mission)
        })
        
    }
}

struct ImageRowView: View {
    let img: String?
    var body: some View {
        AsyncImage(
            url: URL(string: img ?? K.IMG.defaultHeaderURL),
            content: { image in
                image
                    .resizable()
                    .frame(maxHeight: 250)
                    .aspectRatio(0.5, contentMode: .fill)
                    
            },
            placeholder: {
                ProgressView()
            })
    }
}

struct DataRowView: View{
    let mission: MissionModel
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 4){
                TitleMissionRow(text: mission.mission_name)
                SubtitleMissionRow(text: mission.rocket.rocket_name)
                SubtitleMissionRow(text: mission.launch_site.site_name)
            }
            .padding(.vertical)
            Spacer()
            VStack(alignment: .trailing, spacing: 10.0){
                DateView(date: Date(timeIntervalSince1970: TimeInterval(mission.launch_date_unix)))
            }
        }
        .padding(.horizontal)
        .background(Color.cardBackground)
    }
}


struct missionRow_Previews: PreviewProvider {
    static private var mission = Binding.constant(Mission())
    static var previews: some View {
        MissionRow(mission: mission.mission, detailIsVisible: false)
    }
}
