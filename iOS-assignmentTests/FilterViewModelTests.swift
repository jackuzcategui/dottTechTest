//
//  FilterViewModelTests.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 03/09/2022.
//

import XCTest
@testable import iOS_assignment

class FilterViewModelTests: XCTestCase {
    func testViewModel() {
        let storage = StorageMock()
        let provider = VehiclesProvider(storage: storage)
        let viewModel = FilterViewModel(provider: provider)

        viewModel.didTapApplyFilter(filters: [VehicleColor.redGreen])

        XCTAssertEqual(provider.filters, [VehicleColor.redGreen])
        XCTAssertEqual(storage.currentFilters, [VehicleColor.redGreen])
    }

    func testVerifyEmptyFilter() {
        let storage = StorageMock()
        let provider = VehiclesProvider(storage: storage)
        let viewModel = FilterViewModel(provider: provider)

        let isFilterApplied = viewModel.isFilterApplied(filter: .redGreen)

        XCTAssertFalse(isFilterApplied)
    }

    func testVerifyAppliedFilter() {
        let storage = StorageMock()
        let provider = VehiclesProvider(storage: storage)
        let viewModel = FilterViewModel(provider: provider)

        viewModel.didTapApplyFilter(filters: [VehicleColor.redGreen])
        let isFilterApplied = viewModel.isFilterApplied(filter: .redGreen)

        XCTAssertTrue(isFilterApplied)
    }

    func testVerifyAppliedDifferentFilter() {
        let storage = StorageMock()
        let provider = VehiclesProvider(storage: storage)
        let viewModel = FilterViewModel(provider: provider)

        viewModel.didTapApplyFilter(filters: [VehicleColor.blueRed, VehicleColor.pinkYellow, VehicleColor.yellowBlue])
        let isFilterApplied = viewModel.isFilterApplied(filter: .redGreen)

        XCTAssertFalse(isFilterApplied)
    }
}
