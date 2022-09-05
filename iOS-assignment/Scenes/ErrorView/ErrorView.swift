//
//  ErrorView.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import UIKit
import SnapKit

final class ErrorView: UIView {
    private let titleLabel: TitleLabel
    private let textLabel: BodyLabel

    let type: ErrorType

    init(type: ErrorType) {
        self.titleLabel = TitleLabel()
        self.textLabel = BodyLabel()
        self.type = type

        super.init(frame: .zero)
    }

    func setupUI() {
        snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(0)
        }

        backgroundColor = .red

        addSubview(titleLabel)
        addSubview(textLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        titleLabel.text = "We've encountered an error!"
        titleLabel.textColor = .white

        textLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }

        textLabel.textColor = .white
        setTextLabel()

        self.superview?.layoutSubviews()
    }

    func display() {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveEaseIn) {
            self.snp.updateConstraints {
                $0.height.equalTo(100)
            }
            self.superview?.layoutIfNeeded()
        } completion: { _ in
            self.dismiss()
        }

    }

    func dismiss() {
        UIView.animate(withDuration: 0.1,
                       delay: 5,
                       options: .curveEaseIn) {
            self.snp.updateConstraints {
                $0.height.equalTo(0)
            }
            self.superview?.layoutIfNeeded()
        }
    }

    private func setTextLabel() {
        textLabel.text = type.message
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ErrorType {
    case server
    case connection

    var message: String {
        switch self {
        case .server:
            return "Internal Server Error. Please try again."
        case .connection:
            return "No internet connection. Please try again."
        }
    }
}
