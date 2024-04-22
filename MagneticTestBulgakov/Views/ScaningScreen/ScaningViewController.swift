//
//  ScaningViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 21.04.2024.
//

import UIKit
import Lottie

final class ScaningViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = ResultDevicesViewModel()
    private let animationView = LottieAnimationView()
    private var autoTransitionTimer: Timer?
    
    private let scanningLabel: UILabel = {
        return UILabel.customLabel(
            text: "Scanning Your Wi-Fi",
            textColor: .white,
            font: UIFont.systemFont(ofSize: 15))
    }()
    
    private let wifiNameLabel: UILabel = {
        return UILabel.customLabel(
            text: "TLind_246_lp",
            textColor: .lightPurple,
            font: UIFont.systemFont(ofSize: 28))
    }()
    
    private let deviceCountLabel: UILabel = {
        return UILabel.customLabel(
            text: "23",
            textColor: .lightPurple,
            font: UIFont.boldSystemFont(ofSize: 28))
    }()
    
    private let devicesFoundLabel: UILabel = {
        return UILabel.customLabel(
            text: "Devices Found...",
            textColor: .white,
            font: UIFont.boldSystemFont(ofSize: 17))
    }()
    
    private let hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightPurple
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomBackButton()
        setupViews()
        setupConstraints()
        viewModel.loadDevices()
        updateDeviceCountLabel()
        setupAnimation()
        startAnimationTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimationTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoTransitionTimer?.invalidate()
        autoTransitionTimer = nil
    }
    
    // MARK: - Methods
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(searchButton)
        view.addSubview(animationView)
        view.addSubview(scanningLabel)
        view.addSubview(wifiNameLabel)
        view.addSubview(hStackView)
        hStackView.addArrangedSubview(deviceCountLabel)
        hStackView.addArrangedSubview(devicesFoundLabel)
    }
    
    private func setupAnimation() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = LottieAnimation.named("hc6 s.json")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
    private func startAnimationTimer() {
        autoTransitionTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(navigateToResultsViewController), userInfo: nil, repeats: false)
    }
    
    private func updateDeviceCountLabel() {
        deviceCountLabel.text = "\(viewModel.numberOfDevices)"
    }
    
    @objc private func navigateToResultsViewController() {
        navigationController?.pushViewController(ResultDevicesViewController(), animated: true)
    }
}

// MARK: - Extensions
extension ScaningViewController {
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scanningLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            scanningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wifiNameLabel.topAnchor.constraint(equalTo: scanningLabel.bottomAnchor),
            wifiNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hStackView.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
