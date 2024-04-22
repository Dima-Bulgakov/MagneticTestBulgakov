//
//  ResultDevicesViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 21.04.2024.
//

import UIKit

final class ResultDevicesViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = ResultDevicesViewModel()
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(ResultDevicesTableViewCell.self, forCellReuseIdentifier: ResultDevicesTableViewCell.identifier)
        table.layer.cornerRadius = 8
        table.rowHeight = 48
        table.backgroundColor = .black
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let numberOfDevicesLabel: UILabel = {
        return UILabel.customLabel(
            text: "5",
            textColor: .lightPurple,
            font: UIFont.boldSystemFont(ofSize: 34))
    }()
    
    private let devicesLabel: UILabel = {
        return UILabel.customLabel(
            text: "Devices",
            textColor: .white,
            font: UIFont.boldSystemFont(ofSize: 34))
    }()
    
    private let wifiNameLabel: UILabel = {
        return UILabel.customLabel(
            text: "WIFI_Name",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 15))
    }()
    
    private let hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
        setupViews()
        setupConstraints()
        viewModel.loadDevices()
        updateDeviceCountLabel()
        tableView.reloadData()
    }
    
    // MARK: - Methods
    private func setupViews() {
        setupTitle("Result")
        view.backgroundColor = .black
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(hStackView)
        hStackView.addArrangedSubview(numberOfDevicesLabel)
        hStackView.addArrangedSubview(devicesLabel)
        view.addSubview(wifiNameLabel)
    }
    
    private func updateDeviceCountLabel() {
        numberOfDevicesLabel.text = "\(viewModel.numberOfDevices)"
    }
}

// MARK: - Extensions
extension ResultDevicesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDevices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ResultDevicesTableViewCell.identifier,
            for: indexPath) as? ResultDevicesTableViewCell else {
            fatalError("DeviceTableViewCell not found")
        }
        
        let device = viewModel.devices[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(with: device)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DevicesDetailViewController()
        
        if let selectedDevice = viewModel.device(at: indexPath.row) {
            detailViewController.deviceModel = selectedDevice
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ResultDevicesViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.25),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wifiNameLabel.topAnchor.constraint(equalTo: hStackView.bottomAnchor, constant: 5),
            wifiNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
