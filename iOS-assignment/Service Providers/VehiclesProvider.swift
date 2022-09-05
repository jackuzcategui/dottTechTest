//
//  VehiclesProvider.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation

final class VehiclesProvider {
    var storage: FilterStorageType

    var originalVehicleSet: [Vehicle]?

    var vehicles: [Vehicle]?

    var filters: [VehicleColor]?

    init(storage: FilterStorageType = FilterStorage()) {
        self.storage = storage
    }

    func filterResults() {
        guard let filters = filters, !filters.isEmpty else {
            vehicles = originalVehicleSet
            return
        }
        vehicles = originalVehicleSet?.filter { filters.contains($0.color) }
    }
}
