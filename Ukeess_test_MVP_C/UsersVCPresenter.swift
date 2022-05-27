//
//  PersonPresenter.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

protocol UsersVCPresentable: AnyObject {
    var view: UserPresenterViewable? { get set }
    
    func loadUsers()
    func numberOfRowsInSection(_ section: Int) -> Int
    func getModel(for indexPath: IndexPath) -> UserTableViewModel
    func getDetailedModel(for indexPath: IndexPath) -> UserDetailVCModel
}


class UsersVCPresenter {
    
    private var usersArray = [User]()
    weak var view: UserPresenterViewable?
    
    private let interactor: UsersVCInteractor
    init(interactor: UsersVCInteractor) {
        self.interactor = interactor
    }
    
    private func getUser(for indexPath: IndexPath) -> User {
        usersArray[indexPath.row]
    }
}

//MARK: - UserVCPresentable
extension UsersVCPresenter: UsersVCPresentable {
    
    func loadUsers() {
        interactor.loadUsers { users in
            self.usersArray = users
            self.view?.reloadData()
        }
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        usersArray.count
    }
    
    func getModel(for indexPath: IndexPath) -> UserTableViewModel {
        let user = getUser(for: indexPath)
        return UserTableViewModel(user: user)
    }
    
    func getDetailedModel(for indexPath: IndexPath) -> UserDetailVCModel {
        let user = getUser(for: indexPath)
        return UserDetailVCModel(user: user)
    }
}
