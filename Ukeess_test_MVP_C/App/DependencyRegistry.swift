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
        let interactor = UserInteractor(userService: loader)
        let presenter  = UserPresenter(interactor: interactor)
        let vc = UserViewController(presenter: presenter)
        vc.coordinator = coordinator
        return vc
    }
    
    func makeUrlUsersVC(coordinator: ViewControllersCoordination) -> UIViewController {
        let loader = UrlUsersService()
        let interactor = UserInteractor(userService: loader)
        let presenter  = UserPresenter(interactor: interactor)
        let vc = UserViewController(presenter: presenter)
        vc.coordinator = coordinator
        return vc
    }
    
    //func makeUserDetailsVC(corrdinator: ViewControllersCoordination) -> UIViewController
    
}
