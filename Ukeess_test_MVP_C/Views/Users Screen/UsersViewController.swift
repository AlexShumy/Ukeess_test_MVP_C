//
//  UserViewController.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import UIKit

protocol UserPresenterViewable: AnyObject {
    func reloadData()
}

class UsersViewController: UIViewController {
    
    private let userTableView = UITableView()
    
    weak var coordinator: ViewControllersCoordination?
    
    private var presenter: UsersVCPresentable
    
    init(presenter: UsersVCPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurUserTableView()
        presenter.loadUsers()
    }
    
    private func configurUserTableView() {
        
        userTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(userTableView)
        userTableView.frame = view.bounds
        userTableView.dataSource = self
        userTableView.delegate = self
    }
}

    //MARK: - UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let model = presenter.getModel(for: indexPath)
        cell.textLabel?.text = model.user.name
        return cell
    }
}


    //MARK: - UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = presenter.getDetailedModel(for: indexPath)
        coordinator?.showUserDetailsVC(user: model)
    }
}


    //MARK: - UserPresenterViewable

extension UsersViewController: UserPresenterViewable {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
}


    //MARK: - PersonsTableViewCellModel

struct UserTableViewModel {
    let user: User
}
