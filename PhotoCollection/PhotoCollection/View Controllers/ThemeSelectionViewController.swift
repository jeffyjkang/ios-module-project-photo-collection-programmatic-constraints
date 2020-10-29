//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    private func setUpSubViews() {
        // label
        let themeLabel = UILabel()
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.textAlignment = .center
        themeLabel.text = "Select the theme you would like to use:"
        view.addSubview(themeLabel)
        // two buttons
        let darkThemeButton = UIButton()
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.contentMode = .scaleAspectFit
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.setTitleColor(.black, for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkThemeButton)
        let blueThemeButton = UIButton()
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.contentMode = .scaleAspectFit
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.setTitleColor(.blue, for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueThemeButton)
        // constraints
        let labelLeadingConstraint = themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let labelTopConstraint = themeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let labelTrailingConstraint = themeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        
        let darkTopConstraint = darkThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 8)
        let darkTrailingConstraint = darkThemeButton.trailingAnchor.constraint(equalTo: themeLabel.centerXAnchor, constant: -20)
        
        let blueTopConstraint = blueThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 8)
        let blueLeadingConstraint = blueThemeButton.leadingAnchor.constraint(equalTo: themeLabel.centerXAnchor, constant: 20)
        
        NSLayoutConstraint.activate([labelLeadingConstraint, labelTopConstraint, labelTrailingConstraint, darkTopConstraint, darkTrailingConstraint, blueTopConstraint, blueLeadingConstraint])
    }
    
}
