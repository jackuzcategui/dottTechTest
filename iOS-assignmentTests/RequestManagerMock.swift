//
//  RequestManagerMock.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 03/09/2022.
//

import Foundation
import UIKit
@testable import iOS_assignment

final class RequestManagerMock: RequestManagerType {
    var onImage: ((UIImage?) -> Void)?

    func getImage(from url: URL) {
        onImage?(UIImage())
    }
}
