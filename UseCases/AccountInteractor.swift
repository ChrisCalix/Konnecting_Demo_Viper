//
//  AccountInteractor.swift
//  UseCases
//
//  Created by Christian Calixto on 22/4/23.
//

import RxSwift
import KonnectingService

public final class AccountInteractor {

    private let websocketService: ChatroomWebSocketAPI

    init(websocketService: ChatroomWebSocketAPI) {
        self.websocketService = websocketService
    }
}

extension AccountInteractor {

    public func login(username: String, email: String) -> Single<()>{
        
        websocketService.login(username: username, email: email)
        return .never()
    }
}
