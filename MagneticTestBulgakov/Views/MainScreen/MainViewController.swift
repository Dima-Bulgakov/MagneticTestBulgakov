//
//  ViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 20.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let networkSubview = NetworkInfoView()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "mainBackgroundImage"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let hStackView1: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 40
        return stack
    }()
    
    private let hStackView2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 40
        return stack
    }()
    
    private let vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        networkSubview.onScanButtonPressed = { [weak self] in
            self?.performNetworkScan()
        }
    }
    
    // MARK: - Methods
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(backgroundImage)
        view.addSubview(networkSubview)
        setupNavigationButton()
        setupButtons()
        view.addSubview(vStackView)
    }
    
    private func setupNavigationButton() {
        let button = UIBarButtonItem(
            image: UIImage(systemName: "slider.vertical.3"),
            style: .plain, target: self,
            action: #selector(otherButtonAction))
        button.tintColor = .white
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupButtons() {
        let infraredButton = createCustomButton(image: "infraredButton", action: #selector(otherButtonAction))
        let bluetoothButton = createCustomButton(image: "bluetoothButton", action: #selector(otherButtonAction))
        let magneticButton = createCustomButton(image: "magneticButton", action: #selector(magneticButtonAction))
        let antispyButton = createCustomButton(image: "antispyButton", action: #selector(otherButtonAction))
        
        hStackView1.addArrangedSubview(infraredButton)
        hStackView1.addArrangedSubview(bluetoothButton)
        hStackView2.addArrangedSubview(magneticButton)
        hStackView2.addArrangedSubview(antispyButton)
        
        vStackView.addArrangedSubview(hStackView1)
        vStackView.addArrangedSubview(hStackView2)
    }
    
    private func createCustomButton(image: String, action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: image), for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    private func performNetworkScan() {
        navigationController?.pushViewController(ScaningViewController(), animated: true)
    }
    
    @objc private func otherButtonAction() {
        print("Button Tapped")
    }
    
    @objc private func magneticButtonAction() {
        navigationController?.pushViewController(MagneticDetectionViewController(), animated: true)
    }
}

// MARK: - Extensions
extension MainViewController {
    func setupConstraints() {
        
        networkSubview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            networkSubview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            networkSubview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            networkSubview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            networkSubview.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        NSLayoutConstraint.activate([
            vStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            vStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            vStackView.topAnchor.constraint(equalTo: networkSubview.bottomAnchor, constant: 20),
            vStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}
