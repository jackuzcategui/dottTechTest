//
//  VehiclesViewModel.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 30/08/2022.
//

import Foundation
import RxSwift

final class VehiclesViewModel {
    private let disposeBag: DisposeBag

    private let service: VehiclesServiceType
    private let mapper: VehicleMapperType
    let provider: VehiclesProvider
    private let errorLogger: ErrorLoggerType
    private var disposable: Disposable?

    var numberOfVehicles: Int {
        provider.vehicles?.count ?? 0
    }

    var isListFiltered: Bool {
        provider.storage.currentFilters.count > 0
    }

    var onVehicleLoad: (() -> Void)?
    var onError: ((ErrorType) -> Void)?

    init(service: VehiclesServiceType = VehiclesService(),
         provider: VehiclesProvider = VehiclesProvider(),
         errorLogger: ErrorLoggerType = ErrorLogger(),
         mapper: VehicleMapperType = VehicleMapper()) {
        self.disposeBag = DisposeBag()
        self.service = service
        self.provider = provider
        self.errorLogger = errorLogger
        self.mapper = mapper
    }

    func viewDidLoad() {
        fetchStoredFilters()
        fetchVehicles()
    }

    func didPullToRefresh() {
        disposable?.dispose()
        fetchVehicles()
    }

    private func fetchStoredFilters() {
        provider.filters = provider.storage.currentFilters
    }

    private func fetchVehicles() {
        disposable = service.fetchVehicles()
            .subscribe { data in
                self.parseData(data)
                self.provider.filterResults()
                DispatchQueue.main.async { [weak self] in
                    self?.onVehicleLoad?()
                }
            } onError: { error in
                DispatchQueue.main.async { [weak self] in
                    let apiError = error.localizedDescription.contains { character in
                        character == "1"
                    } ? APIError.serverInternal : APIError.connection
                    self?.errorLogger.record(error: apiError)
                    self?.onError?(apiError == .serverInternal ? .server : .connection)
                }
            }
    }

    private func parseData(_ data: Data) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            self.provider.originalVehicleSet = self.mapper.map(json: json)
            self.provider.vehicles = self.mapper.map(json: json)
        } catch {
            let params = DottError.ErrorParameters(className: String(describing: VehiclesViewModel.self),
                                                   methodName: #function,
                                                   errorMessage: "Unable to parse API data.")
            errorLogger.log(error: DottError(params: params))
        }
    }

    func getVehicle(at index: Int) -> Vehicle? {
        guard let vehicles = provider.vehicles else {
            return nil
        }
        return vehicles[index]
    }

    func getVehicleIcon(_ color: VehicleColor?) -> String {
        guard let color = color else {
            return "icon/cross"
        }
        switch color {
        case .redGreen:
            return "icon/redGreenScooter"
        case .blueRed:
            return "icon/blueRedScooter"
        case .pinkYellow:
            return "icon/pinkYellowScooter"
        case .yellowBlue:
            return "icon/yellowBlueScooter"
        case .none:
            return "icon/cross"
        }
    }
}
