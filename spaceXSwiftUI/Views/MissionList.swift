//
//  MissionList.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 16/11/22.
//

import SwiftUI

struct MissionList: View {
    @State private var detailIsShowing = false
    @State private var launchSuccess = true
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading){
                TitleText(text: K.Text.launches)
                    .padding()
                SegmentedView(launchSuccess: $launchSuccess)
                MissionListView(launchSuccess: $launchSuccess)
            }
        }
    }
}

struct SegmentedView: View {
    @Binding var launchSuccess: Bool
    var body: some View{
        VStack {
            Picker("Mission Type", selection: $launchSuccess) {
                Text("Succeeded").tag(true)
                Text("Not Succeded").tag(false)
            }
            .padding(.horizontal, 30)
            .pickerStyle(.segmented)
            .foregroundColor(Color.accentColor)
        }
    }
}

struct MissionListView: View {
    @ObservedObject var repository = LaunchesAPIRepository()
    @Binding var launchSuccess: Bool
    var body: some View {
        List{
            ForEach($repository.missions.indices, id: \.self) { i in
                if repository.missions[i].launch_success == launchSuccess{
                    MissionRow(mission: $repository.missions[i], detailIsVisible: false)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    //store.delete(message)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }
        .padding(.horizontal, 20.0)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionList()
    }
}
