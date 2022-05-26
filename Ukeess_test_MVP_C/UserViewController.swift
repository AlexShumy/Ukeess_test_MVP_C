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

class UserViewController: UIViewController {

    private let userTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    weak var coordinator: ViewControllersCoordination?
    private var presenter: UserVCPresentable
    
    init(presenter: UserVCPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        presenter.view = self
        configurUserTableView()
        presenter.loadUsers()
    }
    
    private func configurUserTableView() {
        view.addSubview(userTableView)
        userTableView.frame = view.bounds
        userTableView.dataSource = self
        userTableView.delegate = self
        
    }

}


//MARK: - UITableViewDataSource
extension UserViewController: UITableViewDataSource {
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
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // go to UserDetailsVC
    }
}


//MARK: - UserPresenterViewable
extension UserViewController: UserPresenterViewable {
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
