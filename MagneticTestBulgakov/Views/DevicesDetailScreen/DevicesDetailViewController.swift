//
//  DevicesDetailViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 21.04.2024.
//

import UIKit

final class DevicesDetailViewController: UIViewController {
    
    // MARK: - Properties
    var deviceModel: DeviceModel?
  
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "deviceDetailBackgroundImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var connectionWiFiImage: UIImageView = {
        let imageName = self.deviceModel?.isSuccessfulConnection ?? false ? "trueConnection" : "falseConnection"
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameTitleLabel: UILabel = {
        return UILabel.customLabel(
            text: "Camera",
            textColor: .lightPurple,
            font: UIFont.boldSystemFont(ofSize: 28))
    }()
    
    private let ipTitleLabel: UILabel = {
        return UILabel.customLabel(
            text: "192.168.1.1",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 15))
    }()

    private let connectionTypeLabel: UILabel = {
        return UILabel.customLabel(
            text: "Connection Type",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let connectionTypeValueLabel: UILabel = {
        return UILabel.customLabel(
            text: "Wifi",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let iPAddressLabel: UILabel = {
        return UILabel.customLabel(
            text: "IP Address",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let iPAddressValueLabel: UILabel = {
        return UILabel.customLabel(
            text: "192.168.1.1",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let macAddressLabel: UILabel = {
        return UILabel.customLabel(
            text: "MAC Address",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let macAddressValueLabel: UILabel = {
        return UILabel.customLabel(
            text: "Not Available",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let hostnameLabel: UILabel = {
        return UILabel.customLabel(
            text: "Hostname",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let hostnameValueLabel: UILabel = {
        return UILabel.customLabel(
            text: "gwpc-21141234.local",
            textColor: .grayFont,
            font: UIFont.systemFont(ofSize: 17))
    }()
    
    private let backgroundStackView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Stacks
    private var connectionStackView = UIStackView()
    private var ipAddressStackView = UIStackView()
    private var macStackView = UIStackView()
    private var hostnameStackView = UIStackView()
    
    private let titleVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.backgroundColor = .backgroundPurple
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.backgroundColor = .backgroundPurple
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
        setupViews()
        setupConstraints()
        loadData()
    }
    
    // MARK: - Methods
    private func setupViews() {
        setupTitle("Device Details")
        view.backgroundColor = .black
        view.addSubview(backgroundImage)
        view.addSubview(connectionWiFiImage)
        
        connectionStackView = makeLabelPairStackView(labelOne: connectionTypeLabel, labelTwo: connectionTypeValueLabel)
        ipAddressStackView = makeLabelPairStackView(labelOne: iPAddressLabel, labelTwo: iPAddressValueLabel)
        macStackView = makeLabelPairStackView(labelOne: macAddressLabel, labelTwo: macAddressValueLabel)
        hostnameStackView = makeLabelPairStackView(labelOne: hostnameLabel, labelTwo: hostnameValueLabel)
        
        titleVStack.addArrangedSubview(nameTitleLabel)
        titleVStack.addArrangedSubview(ipTitleLabel)
        vStack.addArrangedSubview(connectionStackView)
        vStack.addArrangedSubview(ipAddressStackView)
        vStack.addArrangedSubview(macStackView)
        vStack.addArrangedSubview(hostnameStackView)
        
        view.addSubview(backgroundStackView)
        backgroundStackView.addSubview(titleVStack)
        backgroundStackView.addSubview(vStack)
    }
    
    private func makeLabelPairStackView(labelOne: UILabel, labelTwo: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [labelOne, labelTwo])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func loadData() {
        if let device = deviceModel {
            ipTitleLabel.text = device.ipAddress
            nameTitleLabel.text = device.name
        }
    }
}

// MARK: - Extensions
extension DevicesDetailViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            connectionWiFiImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectionWiFiImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            connectionWiFiImage.widthAnchor.constraint(equalToConstant: 116),
            connectionWiFiImage.heightAnchor.constraint(equalToConstant: 116),
            
            backgroundStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            backgroundStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundStackView.heightAnchor.constraint(equalToConstant: 294),
            backgroundStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleVStack.topAnchor.constraint(equalTo: backgroundStackView.topAnchor, constant: 30),
            titleVStack.centerXAnchor.constraint(equalTo: backgroundStackView.centerXAnchor),
            titleVStack.heightAnchor.constraint(equalToConstant: 50),

            vStack.leadingAnchor.constraint(equalTo: backgroundStackView.leadingAnchor, constant: 20),
            vStack.trailingAnchor.constraint(equalTo: backgroundStackView.trailingAnchor, constant: -20),
            vStack.topAnchor.constraint(equalTo: titleVStack.bottomAnchor, constant: 30),
            vStack.bottomAnchor.constraint(equalTo: backgroundStackView.bottomAnchor, constant: -20)
        ])
    }
}
