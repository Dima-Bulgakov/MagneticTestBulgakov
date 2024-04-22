//
//  DeviceTableViewCell.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 21.04.2024.
//

import UIKit

final class ResultDevicesTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "DeviceTableViewCell"
    
    private let wifiImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "wifiIcon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let connectionImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "connect"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let deviceNameLabel: UILabel = {
        return UILabel.customLabel(
            text: "",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let ipAddressLabel: UILabel = {
        return UILabel.customLabel(
            text: "",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 13))
    }()
    
    private let vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let chevronImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundPurple
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupViews() {
        contentView.addSubview(wifiImage)
        contentView.addSubview(connectionImage)
        vStackView.addArrangedSubview(deviceNameLabel)
        vStackView.addArrangedSubview(ipAddressLabel)
        contentView.addSubview(vStackView)
        contentView.addSubview(chevronImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            wifiImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            wifiImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            wifiImage.widthAnchor.constraint(equalToConstant: 36),
            
            connectionImage.widthAnchor.constraint(equalToConstant: 12),
            connectionImage.trailingAnchor.constraint(equalTo: wifiImage.trailingAnchor),
            
            vStackView.leadingAnchor.constraint(equalTo: wifiImage.trailingAnchor, constant: 16),
            vStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            chevronImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevronImage.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func configure(with device: DeviceModel) {
        deviceNameLabel.text = device.name
        ipAddressLabel.text = device.ipAddress
        connectionImage.isHidden = device.isSuccessfulConnection
    }
}
