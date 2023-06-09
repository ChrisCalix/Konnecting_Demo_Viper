//
//  Presenter.swift
//  ChatroomLogin
//
//  Created by Christian Calixto on 21/4/23.
//

import Foundation
import UtilityShared
import RxSwift
import RxCocoa

protocol Routing {

}

class Presenter: Presentation {

    typealias UseCases = (
        login: (_ username: String, _ email: String) -> Single<()>, ()
    )

    var input: Input
    var output: Output

    private let useCases: UseCases
    private let router: Routing
    private let bag = DisposeBag()

    init(input: Input, router: Routing, useCases: UseCases) {
        self.input = input
        self.router = router
        self.useCases = useCases
        self.output = Presenter.output(input: self.input)
        self.process()
    }
}

extension Presenter {

    static func output(input: Input) -> Output {

        let enableLoginDriver = Driver.combineLatest(
            input.username.map({ !$0.isEmpty }),
            input.email.map({ !$0.isEmpty && $0.isEmail()})
        ).map({ $0 && $1})

        return (
            enableLogin: enableLoginDriver, ()
        )
    }

    func process() {

        input.login
            .withLatestFrom(Driver.combineLatest(input.username, input.email))
            .asObservable()
            .flatMap({ [useCases] username, email in
                useCases.login(username, email)
            })
            .asDriver(onErrorDriveWith: .never())
            .drive()
            .disposed(by: bag)
    }
}
