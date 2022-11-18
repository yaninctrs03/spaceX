//
//  ContentView.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 16/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var service: Service = Service()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($service.missions.indices, id: \.self) { index in
                    Text(self.service.missions[index].name)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationTitle(Text("spaceX"))
    }
}

class Service: ObservableObject {
    @Published var missions: [MissionSUI]
    
    init() {
        self.missions = [
            MissionSUI(name: "mission 1"),
            MissionSUI(name: "mission 2"),
            MissionSUI(name: "mission 3"),
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
