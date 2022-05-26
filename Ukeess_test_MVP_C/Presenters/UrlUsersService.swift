//
//  UrlUsersService.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

class UrlUsersService: UserLoader {
    
    func loadUsers(completion: @escaping ([User]) -> Void) {

        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            } catch {
                print(error)
                completion([])
            }
        }.resume()
    }
}
