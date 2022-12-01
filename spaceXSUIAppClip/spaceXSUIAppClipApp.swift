//
//  spaceXSUIAppClipApp.swift
//  spaceXSUIAppClip
//
//  Created by Yanin Contreras on 01/12/22.
//

import SwiftUI

@main
struct spaceXSUIAppClipApp: App {
    @ObservedObject var repository = LaunchesAPIRepository()
    @State var mission = Mission()
    var body: some Scene {
        WindowGroup {
            MissionDetailView(mission: $mission.mission)
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity)
        }
    }
    
    func handleUserActivity(_ userActivity: NSUserActivity) {
        guard
            let incomingURL = userActivity.webpageURL,
            let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems
        else {
            return
        }
              
        
        if incomingURL.path == "/v3/launches" {
            
            if let flightNumber = incomingURL.queryParameters?["flight_number"]{
                repository.getMission(withNumber: flightNumber, completionHandler: { missionModel, error in
                    if error == nil{
                        mission.mission = missionModel![0]
                    }
                })
            }
            
        }
    }
}
