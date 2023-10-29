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
    
    func connectSocketServer()
    func disConnectSocketServer()
    
    func onConnectChat(on event: ServerConnectionEvent , connectionChat: OpenChatSocketData)
    func onSendMessage(on event: ServerConnectionEvent , message: MessageData)
    func observeNewMessage(on event: ServerConnectionEvent, onReceiveMessage: @escaping MessageCallBack)
    
    func onExitConnectChat(on event: ServerConnectionEvent)
}

final public class DefaultChatSocketService: ChatSocketService {
    
    private let url: URL
    private let manager: SocketManager
    private var socket: SocketIOClient { manager.defaultSocket }
    
    
    public init(url: URL) {
        self.url = url
        self.manager = SocketManager(socketURL: url, config: [.log(true)])
    }
    
    /// Connect to url server
    public  func connectSocketServer() {
        socket.connect()
    }
    
    /// DisConnect to url server
    public  func disConnectSocketServer() {
        socket.disconnect()
    }
    
    /// On Open chat message need to stop send notification
    /// - Parameters:
    ///   - event: event that send data with it
    ///   - connectionChat: Information of connection chat
    public  func onConnectChat(
        on event: ServerConnectionEvent,
        connectionChat: OpenChatSocketData
    ) {
        let emitedData = OpenChatSocketDataMapper.map(connectionChat)
        socket.emit(event.event, emitedData)
    }
    
    /// Send Chat Message
    /// - Parameters:
    ///   - event: event that send data with it
    ///   - message: message that sent
    public  func onSendMessage(
        on event: ServerConnectionEvent,
        message: MessageData
    ) {
        let emitedMessage = MessageDataMapper.map(message)
        socket.emit(event.event, emitedMessage)
    }
    
    /// On Success upload message in chat
    /// - Parameters:
    ///   - event: event that send data with it
    ///   - onReceiveMessage: when recive a new message value
    public  func observeNewMessage(
        on event: ServerConnectionEvent = ReceiveMessageConnectionEvent(),
        onReceiveMessage: @escaping MessageCallBack)  {
            socket.on(event.event) { data, _ in
                onReceiveMessage(data.messageMapper)
            }
        }
    
    /// On Exit Chat Service
    /// - Parameter event: event server listener
    public  func onExitConnectChat(
        on event: ServerConnectionEvent = ExitConnectionEvent()
    ) {
        socket.emit(event.event)
    }
}

private extension [Any] {
    var messageMapper: MessageData? {
        guard let json = self[0] as? [String: Any] else { return nil }
        guard let dataSerial = try? JSONSerialization.data(withJSONObject: json) else { return nil }
        return try? JSONDecoder().decode(MessageData.self, from: dataSerial)
    }
}
