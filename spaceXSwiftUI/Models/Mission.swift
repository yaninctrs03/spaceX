//
//  Mission.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 17/11/22.
//

import Foundation

struct Mission {
    
    var mission = MissionModel(mission_name: "DemoSat",
                               rocket: Rocket(rocket_id: "falcon1",
                                              rocket_name: "Falcon 1",
                                              rocket_type: "Merlin A"),
                               launch_site: LaunchSite(
                                site_id: "kwajalein_atoll",
                                site_name: "Kwajalein Atoll",
                                site_name_long: "Kwajalein Atoll Omelek Island"),
                               launch_date_unix: 1174439400,
                               launch_success: false,
                               links: Links(mission_patch: nil, mission_patch_small: "https://images2.imgbox.com/4f/e3/I0lkuJ2e_o.png", flickr_images: [String]()),
                               details: "Successful first stage burn and transition to second stage, maximum altitude 289 km, Premature engine shutdown at T+7 min 30 s, Failed to reach orbit, Failed to recover first stage")
}

//MARK: - Mission
struct MissionModel: Codable, Identifiable {
    var id: String {mission_name}
    let mission_name: String
    let rocket: Rocket
    let launch_site: LaunchSite
    let launch_date_unix: Int
    let launch_success: Bool?
    let links: Links
    let details: String?
}

// MARK: - Links
struct Links: Codable {
    let mission_patch: String?
    let mission_patch_small: String?
    let flickr_images: [String]
}

// MARK: - Rocket
struct Rocket: Codable {
    let rocket_id: String
    let rocket_name: String
    let rocket_type: String
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let site_id: String
    let site_name: String
    let site_name_long: String
}
