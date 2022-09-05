//
//  VehicleMapperMock.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import RxSwift
@testable import iOS_assignment

final class VehicleMapperMock: VehicleMapperType {
    func map(json: [String : Any]?) -> [Vehicle] {
        [Vehicle(color: .blueRed, qrURL: URL(string: "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")!, identificationCode: "D34-GOA"),
         Vehicle(color: .redGreen, qrURL: URL(string: "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")!, identificationCode: "DCS-FEO"),
         Vehicle(color: .yellowBlue, qrURL: URL(string: "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")!, identificationCode: "QWP-CSL"),
         Vehicle(color: .pinkYellow, qrURL: URL(string: "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")!, identificationCode: "UE1-LSM"),]
    }
}

final class ServiceMock: VehiclesServiceType {
    func fetchVehicles() -> Observable<Data> {
        let getVehicles = Observable.just(try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted))
        return getVehicles
    }
}

final class StorageMock: FilterStorageType {
    var currentFilters: [VehicleColor] = []
}
