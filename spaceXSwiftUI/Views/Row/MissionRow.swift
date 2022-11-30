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
                .frame(height: 20.0)
        }
        .onTapGesture {
            detailIsVisible = true
        }
        .sheet(isPresented: $detailIsVisible) {
            MissionDetailView(mission: $mission)
        }
        
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
                    .frame(maxWidth: 400, maxHeight: 300)
                    .aspectRatio(contentMode: .fill)
                    
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
            VStack(alignment: .leading, spacing: 15.0){
                MissionTextRow(text: mission.mission_name)
                RocketTextRow(text: mission.rocket.rocket_name)
            }
            .padding(.bottom)
            Spacer()
            VStack(alignment: .trailing, spacing: 15.0){
                DateView(date: Date(timeIntervalSince1970: TimeInterval(mission.launch_date_unix)))
                LaunchTextRow(text: mission.launch_site.site_name)
            }
            .padding(.vertical)
        }
        .padding(.all, 10)
        .background(Color.cardBackground)
    }
}


struct missionRow_Previews: PreviewProvider {
    static private var mission = Binding.constant(Mission())
    static var previews: some View {
        MissionRow(mission: mission.mission, detailIsVisible: false)
    }
}
