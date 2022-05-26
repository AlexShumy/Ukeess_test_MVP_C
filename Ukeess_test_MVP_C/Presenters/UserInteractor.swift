//
//  UserInteractor.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

class UserInteractor {
    
    private let userService: UserLoader
    init(userService: UserLoader) {
        self.userService = userService
    }
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        userService.loadUsers(completion: completion)
    }

}
