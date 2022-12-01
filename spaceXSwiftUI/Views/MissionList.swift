//
//  MissionList.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 16/11/22.
//

import SwiftUI

struct MissionList: View {
    @State private var detailIsShowing = false
    @State private var launchSuccess = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading){
                TitleText(text: K.Text.launches)
                    .padding(.horizontal, 20)
                SegmentedView(launchSuccess: $launchSuccess)
                MissionListView()
            }
        }
    }
}

struct SegmentedView: View {
    @Binding var launchSuccess: Bool
    var body: some View{
        VStack {
            Picker("What is your favorite color?", selection: $launchSuccess) {
                Text("Success").tag(true)
                Text("Not Succeded").tag(false)
            }
            .pickerStyle(.segmented)
            Text("Value: \(launchSuccess.description)")
        }
    }
}

struct MissionListView: View {
    @ObservedObject var repository = LaunchesAPIRepository()
    var body: some View {
        List{
            ForEach($repository.missions.indices, id: \.self) { i in
                MissionRow(mission: $repository.missions[i], detailIsVisible: false)
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
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .environment(\.defaultMinListRowHeight, 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionList()
    }
}
