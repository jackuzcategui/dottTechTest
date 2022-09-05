//
//  DetailViewModel.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import UIKit

final class DetailViewModel {
    struct DetailConfig {
        let qrURL: URL
        let identificationCode: String
    }
    let qrURL: URL
    let identificationCode: String
    private var requestManager: RequestManagerType

    var onImageDownload: ((UIImage?) -> Void)?

    init(config: DetailConfig,
         requestManager: RequestManagerType = RequestManager()) {
        self.qrURL = config.qrURL
        self.identificationCode = config.identificationCode
        self.requestManager = requestManager
    }

    func onPopulate() {
        requestManager.onImage = onImageDownload
        requestManager.getImage(from: qrURL)
    }
}
