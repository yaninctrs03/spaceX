//
//  Constants.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 18/11/22.
//

import Foundation

enum K{
    enum API{
        public static let apiURL = "https://api.spacexdata.com/v3/launches"
    }
    
    enum IMG{
        public static let defaultPatchURL = "https://www.spacex.com/static/images/share.jpg"
        public static let defaultHeaderURL = "https://spaceflightnow.com/wp-content/uploads/2018/02/40126461411_a6e49a61f2_k.jpg"
    }
    
    enum Text{
        public static let title = "spaceX 2.0"
        public static let launches = "Launches"
    }
    
    enum UI{
        public static let backButton = "arrow.left"
        public static let cornerRadius = CGFloat(15.0)
        public static let tagCornerRadius = CGFloat(10.0)
    }
    
    enum MissionDetail{
        public static let rocketName = "Rocket Name"
        public static let rocketType = "Rocket Type"
        public static let launchSite = "Launch Site"
        public static let launchDate = "Launch Date"
        public static let succeeded = "Succeeded"
        public static let yes = "Yes"
        public static let no = "No"
    }
    
    
}
