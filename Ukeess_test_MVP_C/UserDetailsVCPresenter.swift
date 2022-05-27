//
//  UserDetailsVCPresenter.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 27.05.2022.
//

import Foundation

protocol UserDetailsVCPresentable: AnyObject {
    func getModel() -> UserDetailVCModel
}


class UserDetailsVCPresenter {
    
    private var user: User?
    
    var imageLoader: ImageLoader
    
    private var interactor: UserDetailVCInteractor
    
    init(interactor: UserDetailVCInteractor, imageLoader: ImageLoader) {
        self.interactor = interactor
        self.imageLoader = imageLoader
    }
}


extension UserDetailsVCPresenter: UserDetailsVCPresentable {
    
    func getModel() -> UserDetailVCModel {
        interactor.getUser()
    }
}
