//
//  VehicleMapper.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 30/08/2022.
//

import Foundation

protocol VehicleMapperType {
    func map(json: [String : Any]?) -> [Vehicle]
}

final class VehicleMapper: VehicleMapperType {
    func map(json: [String : Any]?) -> [Vehicle] {
        guard let jsonVehicles = json?["vehicles"] as? [[String : Any]] else {
            return []
        }
        var vehicles: [Vehicle] = []
        _ = jsonVehicles.map {
            let color = $0["color"] as? String ?? ""
            let qrURL = $0["qrURL"] as? String ?? ""
            let identificationCode = $0["identificationCode"] as? String ?? ""
            vehicles.append(Vehicle(color: getVehicleColor(color: color), qrURL: URL(string: qrURL)!, identificationCode: identificationCode))
        }
        return vehicles
    }

    private func getVehicleColor(color: String) -> VehicleColor {
        VehicleColor(rawValue: color.lowercased()) ?? .none
    }
}
