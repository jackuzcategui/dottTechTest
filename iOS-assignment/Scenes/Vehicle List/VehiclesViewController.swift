//
//  VehiclesViewController.swift
//  iOS-assignment
//
//  Created by Jack Uzcategui on 30/08/2022.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa

final class VehiclesViewController: UIViewController {
    private let imageView: DottImageView
    private let titleLabel: HeroLabel
    private let filterButton: FilterButton
    private let tableView: DottTableView
    private let indicator: UIActivityIndicatorView
    private let viewModel: VehiclesViewModel
    private let refreshControl: UIRefreshControl

    init(viewModel: VehiclesViewModel) {
        self.imageView = DottImageView(frame: .zero)
        self.titleLabel = HeroLabel()
        self.filterButton = FilterButton()
        self.tableView = DottTableView()
        self.viewModel = VehiclesViewModel()
        self.refreshControl = UIRefreshControl()
        self.indicator = UIActivityIndicatorView()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "vehicleCell")

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
        indicator.startAnimating()
    }

    private func bind() {
        viewModel.onVehicleLoad = reloadData
        viewModel.onError = presentError
    }

    private func reloadData() {
        tableView.reloadData()
        indicator.stopAnimating()
        refreshControl.endRefreshing()
        updateButtonStyle()
    }

    @objc private func didPullToRefresh() {
        viewModel.didPullToRefresh()
    }

    private func presentError(_ type: ErrorType) {
        let errorView = ErrorView(type: type)
        view.addSubview(errorView)
        errorView.setupUI()
        errorView.display()

        reloadData()
    }

    private func setupUI() {
        view.backgroundColor = .white
        setupRefreshControl()
        setupImageView()
        setupTitleLabel()
        setupTableView()
        setupFilterButton()
        setupIndicator()

        viewModel.viewDidLoad()
    }

    private func updateButtonStyle() {
        filterButton.isHidden = viewModel.numberOfVehicles <= 0
        filterButton.isFilterActive = viewModel.isListFiltered
    }
}

extension VehiclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfVehicles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath)
        let vehicle = viewModel.getVehicle(at: indexPath.row)
        cell.textLabel?.text = vehicle?.identificationCode
        cell.imageView?.image = UIImage(named: viewModel.getVehicleIcon(vehicle?.color))
        return cell
    }
}

extension VehiclesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vehicle = viewModel.getVehicle(at: indexPath.row) else {
            return
        }
        let viewModel = DetailViewModel(config: DetailViewModel.DetailConfig(qrURL: vehicle.qrURL, identificationCode: vehicle.identificationCode))
        let detailViewController = DetailViewController(viewModel: viewModel)
        present(detailViewController, animated: true)
    }
}

/// UI setup logic
extension VehiclesViewController {
    private func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    private func setupImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.trailing.top.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(imageView.snp.width).multipliedBy(98/95)
        }
        imageView.image = UIImage(named: "brand/shapes/yellowArc")
    }

    private func setupTitleLabel() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(38)
        }
        titleLabel.text = "Fleet overview"
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(44)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func setupFilterButton() {
        view.addSubview(filterButton)
        filterButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
        }
        filterButton.setTitle("Filter", for: .normal)
        filterButton.addTarget(self, action: #selector(openFilters), for: .touchUpInside)
        filterButton.isHidden = true
    }

    @objc private func openFilters() {
        let filtersVM = FilterViewModel(provider: viewModel.provider)
        filtersVM.onFilterApply = reloadData
        let filtersVC = FilterViewController(viewModel: filtersVM)
        present(filtersVC, animated: true)
    }

    private func setupIndicator() {
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
