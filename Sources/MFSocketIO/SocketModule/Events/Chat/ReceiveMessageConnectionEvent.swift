//
//  ReceiveMessageConnectionEvent.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 18/10/2023.
//

import Foundation

public struct ReceiveMessageConnectionEvent: ServerConnectionEvent {
    public var event: String { "sendMessageRes" }
    public init() {}
}

