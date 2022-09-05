//
//  Vehicles.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 30/08/2022.
//

import Foundation

struct Vehicles {
    let vehicles: [Vehicle]
}

struct Vehicle {
    let color: VehicleColor
    let qrURL: URL
    let identificationCode: String
}

enum VehicleColor: String, Decodable, Encodable {
    case redGreen = "redgreen"
    case blueRed = "bluered"
    case pinkYellow = "pinkyellow"
    case yellowBlue = "yellowblue"
    case none
}
