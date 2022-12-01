//
//  UI.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 29/11/22.
//

import Foundation
import SwiftUI

extension Color{
    static let bottomGradient = Color("BottomGradient")
    static let topGradient = Color("TopGradient")
    static let cardBackground = Color("CardBackground")
    static let tagBackground = Color("Tags")
    static let mainText = Color("MainText")
    static let secondaryText = Color("SecondaryText")
}

extension URL {
    
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
