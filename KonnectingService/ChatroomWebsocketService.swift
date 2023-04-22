//
//  ChatroomWebsocketService.swift
//  KonnectingService
//
//  Created by Christian Calixto on 22/4/23.
//

import Foundation

public protocol ChatroomWebSocketAPI {

    func login(username: String, email: String)
}

public class ChatroomWebsocketService {

    public init() {}
}

extension ChatroomWebsocketService: ChatroomWebSocketAPI {

    public func login(username: String, email: String) {
        print("received username : \(username), and email: \(email)")
    }
}
