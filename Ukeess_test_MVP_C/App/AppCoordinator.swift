//
//  AppCoordinator.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let registry: DependencyRegistry
    private let navigationController: UINavigationController
    init(registry: DependencyRegistry, navigationController: UINavigationController) {
        self.registry = registry
        self.navigationController = navigationController
    }
}


extension AppCoordinator: ViewControllersCoordination {
    func showRootVC() {
        let vc = registry.makeRootVC(coordinator: self)
        navigationController.viewControllers = [vc]
    }
    
    //func showLocalUsersVC()
    
    //func showUrlUsersVC()
    
    //func showUserDetailsVC()
}
