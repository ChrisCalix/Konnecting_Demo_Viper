//
//  ChatroomLoginViewConrtoller.swift
//  ChatroomLogin
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit
import RxCocoa
import RxSwift

class ChatroomLoginViewConrtoller: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

private extension ChatroomLoginViewConrtoller {

    func setupUI() {

        avatarImageView.image = UIImage(named: "ic-chatroom", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil)
        loginButton.setImage(UIImage(named: "ic-login", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil), for: .normal)
    }
}
