//
//  UseCasesFactory.swift
//  UseCases
//
//  Created by Christian Calixto on 22/4/23.
//

import KonnectingService

public final class UseCasesFactory {

    private static let deployedURL = "https://damp-beach-81446.herokuapp.com"
    private static let websocketService = ChatroomWebsocketService(socketUrl: deployedURL)
    public static let accountInteractor: AccountInteractor = AccountInteractor(websocketService: websocketService)
}
