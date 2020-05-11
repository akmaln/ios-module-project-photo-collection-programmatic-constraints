//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ThemeSelectionDelegate {
    func didSetTheme()
}


class ThemeSelectionViewController: UIViewController {

    var delegate: ThemeSelectionDelegate?
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        delegate?.didSetTheme()
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
        delegate?.didSetTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSubViews()
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        let label = UILabel()
        label.text = "Select a theme:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        label .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -2).isActive = true
        
        let darkButton = UIButton(type: .system)
        let blueButton = UIButton(type: .system)
        
        darkButton.setTitle("Dark", for: .normal)
        blueButton.setTitle("Blue", for: .normal)
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        
        blueButton.leadingAnchor.constraint(greaterThanOrEqualTo: darkButton.trailingAnchor, constant: 8).isActive = true
        blueButton.topAnchor.constraint(equalTo: darkButton.topAnchor).isActive = true
        blueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    
}
