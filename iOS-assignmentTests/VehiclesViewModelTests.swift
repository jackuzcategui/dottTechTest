//
//  VehiclesViewModelTests.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import XCTest
@testable import iOS_assignment

class VehiclesViewModelTests: XCTestCase {
    func testViewModel() {
        let serviceMock = ServiceMock()
        let storage = StorageMock()
        let provider = VehiclesProvider(storage: storage)
        let mapper = VehicleMapperMock()
        let viewModel = VehiclesViewModel(service: serviceMock, provider: provider, mapper: mapper)

        viewModel.viewDidLoad()
        XCTAssertEqual(viewModel.numberOfVehicles, 4)
        XCTAssertFalse(viewModel.isListFiltered)

        let vehicle = viewModel.getVehicle(at: 1)
        XCTAssertEqual(vehicle?.color, .redGreen)
        XCTAssertEqual(vehicle?.qrURL.absoluteString, "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")
        XCTAssertEqual(vehicle?.identificationCode, "DCS-FEO")

        XCTAssertEqual(viewModel.getVehicleIcon(vehicle?.color), "icon/redGreenScooter") 
    }

}
