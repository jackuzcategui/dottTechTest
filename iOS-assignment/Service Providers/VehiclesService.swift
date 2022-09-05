//
//  VehiclesService.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import RxSwift
import AssignmentUtility

protocol VehiclesServiceType {
    func fetchVehicles() -> Observable<Data>
}

final class VehiclesService: VehiclesServiceType {
    func fetchVehicles() -> Observable<Data> {
        return AssignmentUtility.requestVehiclesData()
    }
}
