//
//  VehicleMapperTests.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import XCTest
@testable import iOS_assignment

class VehicleMapperTests: XCTestCase {
    func testMapper() {
        let mapper = VehicleMapper()
        let vehicles = mapper.map(json: json)
        let firstVehicle = vehicles.first
        XCTAssertEqual(vehicles.count, 4)
        XCTAssertEqual(firstVehicle?.color, .blueRed)
        XCTAssertEqual(firstVehicle?.qrURL.absoluteString, "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")
        XCTAssertEqual(firstVehicle?.identificationCode, "D34-GOA")
    }
}

let json = ["vehicles": [["color": "blueRed", "qrURL": "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png", "identificationCode": "D34-GOA"],
                         ["color": "RedGreen", "qrURL": "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png", "identificationCode": "DCS-FEO"],
                         ["color": "YellowBlue", "qrURL": "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png", "identificationCode": "QWP-CSL"],
                         ["color": "PinkYellow", "qrURL": "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png", "identificationCode": "UE1-LSM"]]]
