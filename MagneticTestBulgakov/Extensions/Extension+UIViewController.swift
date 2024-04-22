//
//  Extension+UIViewController.swift
//  MagneticTestBulgakov
//
//  Created by Dima on 22.04.2024.
//

import UIKit

extension UIViewController {
    
    func setupCustomBackButton() {
        navigationItem.hidesBackButton = true
        let customBackImage = UIImage(systemName: "chevron.left")
        let customBackButton = UIBarButtonItem(image: customBackImage, style: .plain, target: self, action: #selector(customBackButtonTapped))
        customBackButton.tintColor = UIColor.lightPurple
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc func customBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupTitle(_ title: String) {
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
