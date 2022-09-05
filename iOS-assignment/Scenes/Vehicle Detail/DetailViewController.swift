//
//  DetailViewController.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    private let closeButton: CloseButton
    private let titleLabel: TitleLabel
    private let imageView: DottImageView
    private let viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.closeButton = CloseButton()
        self.titleLabel = TitleLabel()
        self.imageView = DottImageView(frame: .zero)
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        setupUI()
        bind()
        populate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(imageView)

        closeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 12
        closeButton.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }

        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.height.equalTo(imageView.snp.width)
        }
    }

    private func bind() {
        viewModel.onImageDownload = presentImage(image:)
    }

    private func populate() {
        viewModel.onPopulate()
        titleLabel.text = viewModel.identificationCode
    }

    private func presentImage(image: UIImage?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }

    @objc func closeDetail() {
        dismiss(animated: true)
    }
}
