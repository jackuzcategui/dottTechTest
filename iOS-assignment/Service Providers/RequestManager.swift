//
//  RequestManager.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 03/09/2022.
//

import Foundation
import UIKit

protocol RequestManagerType {
    var onImage: ((UIImage?) -> Void)? { get set }
    func getImage(from url: URL)
}

final class RequestManager: RequestManagerType {
    let errorLogger: ErrorLoggerType

    init(errorLogger: ErrorLoggerType = ErrorLogger()) {
        self.errorLogger = errorLogger
    }

    var onImage: ((UIImage?) -> Void)?

    func getImage(from url: URL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                let params = DottError.ErrorParameters(className: String(describing: RequestManager.self),
                                                       methodName: #function,
                                                       errorMessage: "Error downloading QR image.")
                self.errorLogger.log(error: DottError(params: params))
            } else {
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.onImage?(image)
                } else {
                    let params = DottError.ErrorParameters(className: String(describing: RequestManager.self),
                                                           methodName: #function,
                                                           errorMessage: "Couldn't parse image data.")
                    self.errorLogger.log(error: DottError(params: params))
                }
            }
        }
        task.resume()
    }
}
