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
    
    //func makeLocalUsersVC(corrdinator: ViewControllersCoordination) -> UIViewController
    
    //func makeUrlUsersVC(corrdinator: ViewControllersCoordination) -> UIViewController
    
    //func makeUserDetailsVC(corrdinator: ViewControllersCoordination) -> UIViewController
    
}
