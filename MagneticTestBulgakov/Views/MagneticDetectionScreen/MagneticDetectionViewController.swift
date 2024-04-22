//
//  MagneticDetectionViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 20.04.2024.
//

import UIKit

class MagneticDetectionViewController: UIViewController {
    
    // MARK: - Properties
    private var isAnimating = false {
        didSet {
            searchButton.setTitle(isAnimating ? "Stop" : "Start", for: .normal)
        }
    }
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "magneticBackgroundImage"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let halfCircle: UIImageView = {
        let image = UIImageView(image: UIImage(named: "halfCircle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let circle: UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrowCircle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let arrow: UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
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
        setupTitle("Magnetic Detection")
        setupViews()
        setupConstraints()
        setupRotationAnimation()
        setupButtonAction()
    }
    
    // MARK: - Methods
    private func setupViews() {
        setupCustomBackButton()
        view.backgroundColor = .black
        view.addSubview(backgroundImage)
        view.addSubview(halfCircle)
        view.addSubview(searchButton)
        view.addSubview(circle)
        view.addSubview(arrow)
    }
    
    func setupRotationAnimation() {
        let halfRotation = CGFloat.pi
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = halfRotation
        rotationAnimation.duration = 4
        rotationAnimation.autoreverses = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        rotationAnimation.isRemovedOnCompletion = false
        rotationAnimation.fillMode = .forwards
        arrow.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        arrow.layer.position = CGPoint(x: arrow.layer.position.x + arrow.bounds.width/2, y: arrow.layer.position.y)
        arrow.layer.add(rotationAnimation, forKey: "rotationAnimation")
        arrow.layer.speed = 0
    }
    
    func setupButtonAction() {
        searchButton.addTarget(self, action: #selector(toggleAnimation), for: .touchUpInside)
    }
    
    @objc private func toggleAnimation() {
        if isAnimating {
            arrow.layer.speed = 0
            let pausedTime = arrow.layer.convertTime(CACurrentMediaTime(), from: nil)
            arrow.layer.timeOffset = pausedTime
        } else {
            arrow.layer.speed = 1
            let pausedTime = arrow.layer.timeOffset
            arrow.layer.beginTime = CACurrentMediaTime() - pausedTime
            arrow.layer.timeOffset = 0
        }
        isAnimating = !isAnimating
    }
}

// MARK: - Extensions
extension MagneticDetectionViewController {
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        NSLayoutConstraint.activate([
            halfCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            halfCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            halfCircle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            halfCircle.heightAnchor.constraint(equalToConstant: 179)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            circle.widthAnchor.constraint(equalToConstant: 32),
            circle.centerXAnchor.constraint(equalTo: halfCircle.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: halfCircle.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            arrow.widthAnchor.constraint(equalToConstant: 80),
            arrow.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: circle.centerXAnchor, constant: 40)
        ])
    }
}
