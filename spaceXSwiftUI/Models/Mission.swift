//
//  Mission.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 17/11/22.
//

import Foundation


//MARK: - Mission
struct Mission {
    let mission_name: String
    let rocket: Rocket
    let launch_site: LaunchSite
    let launch_date_unix: Int
    let links: Links
    let details: String?
}


// MARK: - Links
struct Links {
    let mission_patch: String?
    let mission_patch_small: String?
    let flickr_images: [String]
}

// MARK: - Rocket
struct Rocket {
    let rocket_id: String
    let rocket_name: String
    let rocket_type: String
}

// MARK: - LaunchSite
struct LaunchSite {
    let site_id: String
    let site_name: String
    let site_name_long: String
}
