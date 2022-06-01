//
//  UserDetailsViewController.swift
//  Ukeess_test_MVP_C
//
//  Created by Oleksandr Shumylo on 27.05.2022.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    
    private var presenter: UserDetailsVCPresenter
    
    init(presenter: UserDetailsVCPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "User's details"
        
        let model = presenter.getModel()
        configureUserInfo(with: model)
    }
    
    func configureUserInfo(with model: UserDetailVCModel) {
        
        let user = model.user
        idLabel.text = String(user.id)
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        cityLabel.text = user.address.city
        
        //using default image for all imageviews utntil teh right imnage is loaded
        userImageView.image = UIImage(named: "no_user_image")
        
        if let imagePath = user.picture {
            presenter.imageLoader.loadImage(of: imagePath, completion: { [weak self] userImage in
                if let image = userImage {
                    DispatchQueue.main.async {
                        self?.userImageView.image = image
                    }
                }
            })
        }
    }
}

    //MARK: - PersonsTableViewCellModel

struct UserDetailVCModel {
    let user: User
}
