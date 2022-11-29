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
        List($repository.missions){ mission in
            MissionRow(mission: mission)
                .onTapGesture {
                    detailIsShowing = true
                }
                .sheet(isPresented: $detailIsShowing) {
                    MissionDetailView(mission: mission)
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MissionList()
    }
}
