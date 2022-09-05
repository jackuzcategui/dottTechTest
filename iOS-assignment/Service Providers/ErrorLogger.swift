//
//  ErrorLogger.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 03/09/2022.
//

import Foundation

struct DottError: Error {
    struct ErrorParameters {
        let className: String
        let methodName: String?
        let errorMessage: String?
    }
    let params: ErrorParameters
}

enum APIError: Error {
    case serverInternal
    case connection

    var errorMessage: String? {
        switch self {
        case .serverInternal:
            return "serverInternal error encountered."
        case .connection:
            return "User connectivity error."
        }
    }
}

protocol ErrorLoggerType {
    func log(error: DottError)
    func record(error: APIError)
}

final class ErrorLogger:ErrorLoggerType {
    // Could be replaced with a Firebase request, for example
    func log(error: DottError) {
        print("Non-Fatal Error >>> \(error.params.className).\(error.params.methodName ?? ""): \(error.params.errorMessage ?? "")")
    }

    func record(error: APIError) {
        print("API Error >>> \(error.errorMessage ?? "")")
    }
}
