//
//  MissionList.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 16/11/22.
//

import SwiftUI

struct MissionList: View {
    @ObservedObject var repository = LaunchesAPIRepository()
    @State private var detailIsShowing = false
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading){
                TitleText(text: K.Text.launches)
                    .padding(.horizontal, 20)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionList()
    }
}
