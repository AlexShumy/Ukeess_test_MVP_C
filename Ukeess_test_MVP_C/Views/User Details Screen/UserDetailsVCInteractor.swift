//
//  UserDetailsVCInteractor.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 27.05.2022.
//

import Foundation

class UserDetailVCInteractor {
    
    private let user: UserDetailVCModel
    
    init(user: UserDetailVCModel) {
        self.user = user
    }
    
    func getUser() -> UserDetailVCModel {
        return user
    }
}
