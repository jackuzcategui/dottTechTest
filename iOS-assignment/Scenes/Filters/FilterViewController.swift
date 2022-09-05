//
//  FilterViewController.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 31/08/2022.
//

import Foundation
import UIKit
import SnapKit

final class FilterViewController: UIViewController {
    private let closeButton: CloseButton
    private let titleLabel: TitleLabel
    private let stackView: UIStackView
    private let applyButton: PrimaryButton
    private var filterViews: [FilterView]?
    private let viewModel: FilterViewModel

    init(viewModel: FilterViewModel) {
        self.closeButton = CloseButton()
        self.titleLabel = TitleLabel()
        self.stackView = UIStackView()
        self.applyButton = PrimaryButton()
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(applyButton)

        closeButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 12
        closeButton.addTarget(self, action: #selector(closeFilters), for: .touchUpInside)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        titleLabel.text = "Filters"

        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(32)
        }
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 24

        applyButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(56)
        }
        applyButton.setTitle("Apply filter", for: .normal)
        applyButton.addTarget(self, action: #selector(applyFilters), for: .touchUpInside)

        buildFilterViews()
    }

    private func buildFilterViews() {
        let filters = [VehicleColor.blueRed, VehicleColor.pinkYellow, VehicleColor.redGreen, VehicleColor.yellowBlue]
        filters.forEach { color in
            let viewModel = FilterViewViewModel(filterColor: color)
            let filterView = FilterView(viewModel: viewModel)
            filterView.setSwitch(self.viewModel.isFilterApplied(filter: color))
            filterView.clipsToBounds = true
            stackView.addArrangedSubview(filterView)
            filterView.setupUI()
        }
    }

    @objc func applyFilters() {
        var appliedFilters: [VehicleColor] = []
        stackView.arrangedSubviews.forEach { filterView in
            if let filterView = filterView as? FilterView,
               filterView.isSwitchedOn {
                appliedFilters.append(filterView.filterColor)
            }
        }
        viewModel.didTapApplyFilter(filters: appliedFilters)
        closeFilters()
    }

    @objc func closeFilters() {
        dismiss(animated: true)
    }
}
