//
//  RepositoryProtocol.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 18/11/22.
//

import Foundation

protocol RepositoryProtocol{
    func getAll(completionHandler: @escaping ([MissionModel]?, Error?) -> Void)
    func getMission(withNumber flightNumber: String, completionHandler: @escaping ([MissionModel]?, Error?) -> Void)
}
