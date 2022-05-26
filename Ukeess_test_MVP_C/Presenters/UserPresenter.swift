//
//  PersonPresenter.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

protocol UserVCPresentable: AnyObject {
    var view: UserPresenterViewable? { get set }
    
    func loadUsers()
    func numberOfRowsInSection(_ section: Int) -> Int
    func getModel(for indexPath: IndexPath) -> UserTableViewModel
}


class UserPresenter {
    
    private var usersArray = [User]()
    weak var view: UserPresenterViewable?
    
    private let interactor: UserInteractor
    init(interactor: UserInteractor) {
        self.interactor = interactor
    }
    
    private func getUser(for indexPath: IndexPath) -> User {
        usersArray[indexPath.row]
    }
}

//MARK: - UserVCPresentable
extension UserPresenter: UserVCPresentable {
    
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
}
