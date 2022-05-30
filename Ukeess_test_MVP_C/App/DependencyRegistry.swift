//
//  DependencyRegistry.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation
import UIKit

class DependencyRegistry {
    
    func makeRootVC(coordinator: ViewControllersCoordination) -> UIViewController {
        let vc = RootViewController()
        vc.coordinator = coordinator
        return vc
    }
    
    func makeJsonlUsersVC(coordinator: ViewControllersCoordination) -> UIViewController {
        let loader = JsonUsersService()
        let interactor = UsersVCInteractor(userService: loader)
        let presenter  = UsersVCPresenter(interactor: interactor)
        let vc = UsersViewController(presenter: presenter)
        vc.title = "Local users"
        vc.coordinator = coordinator
        return vc
    }
    
    func makeUrlUsersVC(coordinator: ViewControllersCoordination) -> UIViewController {
        let loader = UrlUsersService()
        let interactor = UsersVCInteractor(userService: loader)
        let presenter  = UsersVCPresenter(interactor: interactor)
        let vc = UsersViewController(presenter: presenter)
        vc.title = "Remote users"
        vc.coordinator = coordinator
        return vc
    }
    
    func makeUserDetailsVC(user: UserDetailVCModel) -> UIViewController {
        let loader = UserImageService.shared
        let interactor = UserDetailVCInteractor(user: user)
        let presenter = UserDetailsVCPresenter(interactor: interactor, imageLoader: loader)
        let vc = UserDetailsViewController(presenter: presenter)
        return vc
    }
}
