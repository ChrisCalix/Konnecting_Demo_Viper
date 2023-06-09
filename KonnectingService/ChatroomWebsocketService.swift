//
//  ChatroomWebsocketService.swift
//  KonnectingService
//
//  Created by Christian Calixto on 22/4/23.
//

import Starscream
import SocketIO

public protocol ChatroomWebSocketAPI {

    func login(username: String, email: String)
}

public class ChatroomWebsocketService {

    private var socketManager: SocketManager!
    private var socket: SocketIOClient!
    private let socketUrl: String

    public init(socketUrl: String) {
        self.socketUrl = socketUrl
        setup(using: URL(string: self.socketUrl)!)
    }

    deinit {
        socket.disconnect()
    }
}

extension ChatroomWebsocketService: ChatroomWebSocketAPI {

    public func login(username: String, email: String) {
        print("received username : \(username), and email: \(email)")
        self.socket.emit("login", username, email)
    }
}

private extension ChatroomWebsocketService {

    func setup(using socketUrl: URL) {

        socketManager = SocketManager(socketURL: socketUrl)
        socket = socketManager.defaultSocket
        socket.connect()
    }
}
