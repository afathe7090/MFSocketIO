
import Foundation

final public class DefaultChatSocketService: ChatSocketService {
    
    private let url: URL
    private let manager: SocketManager
    private var socket: SocketIOClient { manager.defaultSocket }
    private let timeReconnect: Double
    
    public init(url: URL, timeReconnect: Double = 0.5) {
        self.url = url
        self.timeReconnect = timeReconnect
        self.manager = SocketManager(socketURL: url, config: [.log(true)])
    }
    
    /// Connect to url server
    public func startConnect() {
        socket.connect(timeoutAfter: 0.5, withHandler: {})
    }
    
    /// DisConnect to url server
    public func exitConnection() {
        socket.disconnect()
    }
    
    /// On Open chat message need to stop send notification
    /// - Parameters:
    ///   - event: event that send data with it
    ///   - connectionChat: Information of connection chat
    public func register(
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
    public func send(
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
    public func subscribe(
        on event: ServerConnectionEvent = ReceiveMessageConnectionEvent(),
        onReceiveMessage: @escaping MessageCallBack)  {
            socket.on(event.event) { data, _ in
                onReceiveMessage(data.messageMapper)
            }
        }
    
    public func subscribe(
        on event: ServerConnectionEvent = ReceiveMessageConnectionEvent(),
        onReceiveMessage: @escaping AnyMessage)  {
            socket.on(event.event) { data, _ in
                onReceiveMessage(data)
            }
        }
    
    /// On Exit Chat Service
    /// - Parameter event: event server listener
    public func leave(
        on event: ServerConnectionEvent = ExitConnectionEvent()
    ) {
        socket.emit(event.event)
    }
    
    public func onConnectSuccess(completion: @escaping CallBack) {
        socket.on(clientEvent: .statusChange) { [weak self] _, _ in
            if self?.socket.status == .connected {
                completion()
            }
        }
    }
}

private extension [Any] {
    var messageMapper: MessageData? {
        guard let dataSerial = try? JSONSerialization.data(withJSONObject: self) else { return nil }
        return try? JSONDecoder().decode([MessageData].self, from: dataSerial).first
    }
}
