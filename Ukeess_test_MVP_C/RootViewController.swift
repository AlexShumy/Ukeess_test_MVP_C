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

    private let jsonButtonTapped = UIButton()
    private let urlButtonTapped = UIButton()
    
    weak var coordinator: ViewControllersCoordination?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureJsonButton()
        configureUrlButton()
    
    }

    private func configureJsonButton() {
        jsonButtonTapped.addTarget(self, action: #selector(jsonButtonAction), for: .touchUpInside)
        jsonButtonTapped.setTitle("Load local users", for: .normal)
        jsonButtonTapped.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        jsonButtonTapped.setTitleColor(.black, for: .normal)
        jsonButtonTapped.backgroundColor = .white
        jsonButtonTapped.layer.borderColor = UIColor.black.cgColor
        jsonButtonTapped.layer.borderWidth = 1
        jsonButtonTapped.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jsonButtonTapped)
        jsonButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
        jsonButtonTapped.widthAnchor.constraint(equalToConstant: 250).isActive = true
        jsonButtonTapped.layer.cornerRadius = 5
        view.centerXAnchor.constraint(equalTo: jsonButtonTapped.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: jsonButtonTapped.centerYAnchor).isActive = true
    }
    
    private func configureUrlButton() {
        urlButtonTapped.addTarget(self, action: #selector(urlButtonAction), for: .touchUpInside)
        urlButtonTapped.setTitle("Load remote users", for: .normal)
        urlButtonTapped.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        urlButtonTapped.setTitleColor(.white, for: .normal)
        urlButtonTapped.backgroundColor = .black
        urlButtonTapped.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(urlButtonTapped)
        urlButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
        urlButtonTapped.widthAnchor.constraint(equalToConstant: 250).isActive = true
        urlButtonTapped.layer.cornerRadius = 5
        urlButtonTapped.centerXAnchor.constraint(equalTo: jsonButtonTapped.centerXAnchor).isActive = true
        urlButtonTapped.topAnchor.constraint(equalTo: jsonButtonTapped.bottomAnchor, constant: 40.0).isActive = true
    }

    
    @objc private func jsonButtonAction() {
        coordinator?.showJsonUsersVC()
    }
    
    @objc private func urlButtonAction() {
        coordinator?.showUrlUsersVC()
    }
}

