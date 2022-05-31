//
//  ViewController.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import UIKit

protocol ViewControllersCoordination: AnyObject {
    func showRootVC()
    func showJsonUsersVC()
    func showUrlUsersVC()
    func showUserDetailsVC(user: UserDetailVCModel)
}

class RootViewController: UIViewController {
    
    private let jsonButton = UIButton()
    private let urlButton = UIButton()
    private let stackView = UIStackView()
    
    weak var coordinator: ViewControllersCoordination?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI() {
        configureJsonButton()
        configureUrlButton()
        congigureStackView()
    }
    
    private func configureJsonButton() {
        jsonButton.addTarget(self, action: #selector(jsonButtonTapped), for: .touchUpInside)
        jsonButton.setTitle("Show local users", for: .normal)
        jsonButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        jsonButton.setTitleColor(.black, for: .normal)
        jsonButton.backgroundColor = .white
        jsonButton.layer.borderColor = UIColor.black.cgColor
        jsonButton.layer.borderWidth = 1
        view.addSubview(jsonButton)
        
        //constraints
        jsonButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        jsonButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        jsonButton.layer.cornerRadius = 5
    }
    
    private func configureUrlButton() {
        urlButton.addTarget(self, action: #selector(urlButtonTapped), for: .touchUpInside)
        urlButton.setTitle("Show remote users", for: .normal)
        urlButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        urlButton.setTitleColor(.white, for: .normal)
        urlButton.backgroundColor = .black
        urlButton.layer.borderColor = UIColor.white.cgColor
        urlButton.layer.borderWidth = 1
        view.addSubview(urlButton)
        
        //constraints
        urlButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        urlButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        urlButton.layer.cornerRadius = 5
    }
    
    private func congigureStackView() {
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 40.0
        stackView.addArrangedSubview(jsonButton)
        stackView.addArrangedSubview(urlButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    //MARK: - Target methods
    
    @objc
    private func jsonButtonTapped() {
        coordinator?.showJsonUsersVC()
    }
    
    @objc
    private func urlButtonTapped() {
        coordinator?.showUrlUsersVC()
    }
}

