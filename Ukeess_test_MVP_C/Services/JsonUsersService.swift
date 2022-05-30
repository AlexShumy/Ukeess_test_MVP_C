//
//  JsonUsersService.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

protocol UserLoader {
    func loadUsers(completion: @escaping ([User]) -> Void)
}

class JsonUsersService: UserLoader {
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        guard let path = Bundle.main.path(forResource: "users_data", ofType: "json") else { return }
        guard let strData = try? String(contentsOfFile: path, encoding: .utf8) else { return }
        guard let jsonData = strData.data(using: .utf8) else { return }
        
        do {
            let users = try JSONDecoder().decode([User].self, from: jsonData)
            completion(users)
        } catch {
            print(error)
        }
    }
}
