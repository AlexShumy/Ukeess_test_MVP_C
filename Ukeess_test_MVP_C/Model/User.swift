//
//  Person.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 26.05.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let picture: String?
    let address: Adreess
}

struct Adreess: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

