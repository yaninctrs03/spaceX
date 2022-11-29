//
//  LaunchesAPIRepository.swift
//  spaceXSwiftUI
//
//  Created by Yanin Contreras on 18/11/22.
//

import Foundation
import Alamofire

class LaunchesAPIRepository: RepositoryProtocol, ObservableObject{
    @Published var missions: [MissionModel]
    
    init() {
        self.missions = [MissionModel]()
        getAll { missions, error in
            if error == nil {
                if let safeMissions = missions{
                    self.missions = safeMissions
                }
            }
        }
    }
    
    func getAll(completionHandler: @escaping ([MissionModel]?, Error?) -> Void) {
        AF.request(K.apiURL).responseDecodable(of: [MissionModel].self) { response in
            let _ = response.result.map { missions in
                completionHandler(missions, nil)
            }
            
        }
    }
    
    func getMission(withNumber flightNumber: String, completionHandler: @escaping ([MissionModel]?, Error?) -> Void) {
        let url = "\(K.apiURL)?flight_number=\(flightNumber)"
        AF.request(url).responseDecodable(of: [MissionModel].self) { response in
            let _ = response.result.map { missions in
                completionHandler(missions, nil)
            }
            
        }
    }
    
    
}
