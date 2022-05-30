//
//  UserImageService.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 27.05.2022.
//

import Foundation
import UIKit

protocol ImageLoader: AnyObject {
    func loadImage(of imagePath: String, completion: @escaping (UIImage?) -> Void)
}

class UserImageService: ImageLoader {
    
    static let shared = UserImageService()
    
    private init() { }
    
    func loadImage(of imagePath: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: imagePath) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(nil)
                print("Image loading error: \(error.localizedDescription)")
            } else if let data = data {
                guard let userImage = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                completion(userImage)
            }
        }.resume()
    }
}
