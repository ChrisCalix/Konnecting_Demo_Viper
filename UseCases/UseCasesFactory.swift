//
//  UseCasesFactory.swift
//  UseCases
//
//  Created by Christian Calixto on 22/4/23.
//

import KonnectingService

public final class UseCasesFactory {

    private static let websocketService = ChatroomWebsocketService()
    public static let accountInteractor: AccountInteractor = AccountInteractor(websocketService: websocketService)
}
