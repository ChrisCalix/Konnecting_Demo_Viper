//
//  ChatroomLoginViewConrtoller.swift
//  ChatroomLogin
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit
import RxCocoa
import RxSwift

protocol Presentation {

    typealias Input = (
        username: Driver<String>,
        email: Driver<String>
    )
    typealias Output = (
        enableLogin: Driver<Bool>, ()
    )
    typealias Producer = (Presentation.Input) -> Presentation

    var input: Input { get }
    var output: Output { get }
}

class ChatroomLoginViewConrtoller: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    private var presenter: Presentation!
    var presenterProducer: Presentation.Producer!
    private let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = presenterProducer((
            username: userNameTextField.rx.text.orEmpty.asDriver(),
            email: emailTextField.rx.text.orEmpty.asDriver()
        ))
        setupUI()
        setupBinding()
    }
}

private extension ChatroomLoginViewConrtoller {

    func setupUI() {

        avatarImageView.image = UIImage(named: "ic-chatroom", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil)
        loginButton.setImage(UIImage(named: "ic-login", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil), for: .normal)
        loginButton.setImage(UIImage(named: "ic-login-disabled", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil), for: .disabled)
        loginButton.setImage(UIImage(named: "ic-login-selected", in: Bundle(for: ChatroomLoginViewConrtoller.self), with: nil), for: .highlighted)
    }

    func setupBinding() {

        presenter.output.enableLogin
            .debug("Enable Login Driver", trimOutput: false)
            .drive(loginButton.rx.isEnabled)
            .disposed(by: bag)
    }
}
//#173477
