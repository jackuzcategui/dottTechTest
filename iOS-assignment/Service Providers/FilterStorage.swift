//
//  FilterStorage.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation

protocol FilterStorageType {
    var currentFilters: [VehicleColor] { get set }
}

final class FilterStorage: FilterStorageType {
    static let storageKey = "colorFilters"

    let storage: UserDefaults

    var currentFilters: [VehicleColor] {
        set {
            guard let data = try? JSONEncoder().encode(newValue) else { return }
            UserDefaults.standard.set(data, forKey: FilterStorage.storageKey)
        }
        get {
            guard let data = storage.data(forKey: FilterStorage.storageKey) else { return [] }
            return (try? JSONDecoder().decode([VehicleColor].self, from: data)) ?? []
        }
    }

    init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }
}
