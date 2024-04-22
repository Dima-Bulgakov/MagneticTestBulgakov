//
//  NetworkInfoView.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 20.04.2024.
//

import UIKit

final class NetworkInfoView: UIView {
    
    // MARK: - Properties
    var onScanButtonPressed: (() -> Void)?
    
    private let titleLabel: UILabel = {
        return UILabel.customLabel(
            text: "Current Wi-Fi",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 16))
    }()
    
    private let wifiNameLabel: UILabel = {
        return UILabel.customLabel(
            text: "WIFI_Name",
            textColor: .mediumPurple,
            font: UIFont.boldSystemFont(ofSize: 24))
    }()
    
    private let descriptionLabel: UILabel = {
        return UILabel.customLabel(
            text: "Ready to Scan this network",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 14))
    }()
    
    private let scanButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Scan current network", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightPurple
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        scanButton.addTarget(self, action: #selector(scanButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupViews() {
        backgroundColor = .backgroundPurple
        layer.cornerRadius = 16
        addSubview(titleLabel)
        addSubview(wifiNameLabel)
        addSubview(descriptionLabel)
        addSubview(scanButton)
    }
    
    @objc private func scanButtonAction() {
        onScanButtonPressed?()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            wifiNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            wifiNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: wifiNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scanButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            scanButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            scanButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            scanButton.heightAnchor.constraint(equalToConstant: 50),
            scanButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scanButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
