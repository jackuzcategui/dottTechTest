//
//  DetailViewModelTests.swift
//  iOS-assignmentTests
//
//  Created by Jack Uzcategui on 03/09/2022.
//

import XCTest
@testable import iOS_assignment

class DetailViewModelTests: XCTestCase {
    var isImageDownloaded = false
    func testViewModel() {
        let requestManagerMock = RequestManagerMock()
        let url = URL(string: "https://user-images.githubusercontent.com/4403840/99518015-54d1d800-2990-11eb-84a2-0ad4a3bf6a54.png")!
        let config = DetailViewModel.DetailConfig(qrURL: url, identificationCode: "DCS-FEO")
        let viewModel = DetailViewModel(config: config, requestManager: requestManagerMock)
        viewModel.onImageDownload = { image in
            self.presentImage(image: image)
        }

        viewModel.onPopulate()
        XCTAssertTrue(isImageDownloaded)
    }

    private func presentImage(image: UIImage?) {
        isImageDownloaded = true
    }
}
