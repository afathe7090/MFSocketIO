//
//  ChatSocketService.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public protocol ChatSocketService {
    
    typealias CallBack = () -> Void
    typealias MessageCallBack = (MessageData?) -> Void
    typealias AnyMessage = ([Any]) -> Void
    
    func startConnect()
    func exitConnection()
    
    func onConnectSuccess(completion: @escaping CallBack)
    
    func register(on event: ServerConnectionEvent , connectionChat: OpenChatSocketData)
    func send(on event: ServerConnectionEvent , message: MessageData)
    func subscribe(on event: ServerConnectionEvent, onReceiveMessage: @escaping MessageCallBack)
    func subscribe(on event: ServerConnectionEvent,onReceiveMessage: @escaping AnyMessage)
    func leave(on event: ServerConnectionEvent)
}

