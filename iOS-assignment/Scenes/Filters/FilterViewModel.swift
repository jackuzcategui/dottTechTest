//
//  FilterViewModel.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation

final class FilterViewModel {
    let provider: VehiclesProvider
    var onFilterApply: (() -> Void)?

    init(provider: VehiclesProvider) {
        self.provider = provider
    }

    func didTapApplyFilter(filters: [VehicleColor]) {
        provider.filters = filters
        provider.storage.currentFilters = filters
        provider.filterResults()
        onFilterApply?()
    }

    func isFilterApplied(filter: VehicleColor) -> Bool {
        provider.storage.currentFilters.contains { $0 == filter }
    }
}
