//
//  FilterView.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import UIKit
import SnapKit

final class FilterView: UIView {
    private let filterSwitch: DottSwitch
    private let filterLabel: TitleLabel
    private let viewModel: FilterViewViewModel

    var isSwitchedOn: Bool {
        filterSwitch.isOn
    }

    var filterColor: VehicleColor {
        viewModel.filterColor
    }

    init(viewModel: FilterViewViewModel) {
        self.filterSwitch = DottSwitch()
        self.filterLabel = TitleLabel()
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(filterSwitch)
        addSubview(filterLabel)

        snp.makeConstraints {
            $0.height.equalTo(31)
        }

        filterSwitch.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(31)
        }

        filterLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(filterSwitch.snp.trailing).offset(12)
            $0.height.equalTo(31)
        }

        populate()
    }

    private func populate() {
        filterLabel.text = viewModel.filterText
    }

    func setSwitch(_ isOn: Bool) {
        filterSwitch.isOn = isOn
    }
}

final class FilterViewViewModel {
    let filterColor: VehicleColor
    var filterText: String {
        switch filterColor {
        case .redGreen:
            return "Red/Green"
        case .blueRed:
            return "Blue/Red"
        case .pinkYellow:
            return "Pink/Yellow"
        case .yellowBlue:
            return "Yellow/Blue"
        case .none:
            return ""
        }
    }

    init(filterColor: VehicleColor) {
        self.filterColor = filterColor
    }
}
