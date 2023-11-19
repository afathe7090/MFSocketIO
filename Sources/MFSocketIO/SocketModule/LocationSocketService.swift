//
//  LocationSocketService.swift
//  CAB
//
//  Created by Ahmed Fathy on 23/10/2023.
//
import Foundation

final public class LocationSocketService {
    
    private let url: URL
    private let manager: SocketManager
    private var socket: SocketIOClient { manager.defaultSocket }
    
    public typealias CaptainCallBack = (CaptainTripLocation) -> Void
    
    public init(url: URL) {
        self.url = url
        self.manager = SocketManager(socketURL: url, config: [.log(true)])
        self.socket.connect(timeoutAfter: 0.5, withHandler: {})
    }
    
    /// Update Captain Location
    /// - Parameters:
    ///   - captainLocation: updated data need to mapped form your model
    ///   - event: channel name of sevice updated
    public func sendCaptainLocation(
        captainLocation: CaptainTripLocation,
        with event: ServerConnectionEvent = UpdateLocationConnectionEvent()
    ) {
        let data = CaptainTripLocationSocketDataMapper.map(captainLocation)
        socket.emit(event.event, data)
    }
    
    /// Subscribe to captain location Need to make sure that id of callBack is your trip id
    /// - Parameters:
    ///   - event: Broadcast name of event that subscribe for it
    ///   - completion: Driver CallBack Location
    public func listenCaptainLocation(
        from event: ServerConnectionEvent = DriverLocationConnectionEvent(),
        completion: @escaping CaptainCallBack
    ) {
        socket.on(event.event) { data,_ in
            guard let captainLocation = data.captainMapper else { return }
            completion(captainLocation)
        }
    }
}


private extension [Any] {
    var captainMapper: CaptainTripLocation? {
        let json = String(describing: self)
        guard let dataSerial = json.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode([CaptainTripLocation].self, from: dataSerial)[0]
    }
}
