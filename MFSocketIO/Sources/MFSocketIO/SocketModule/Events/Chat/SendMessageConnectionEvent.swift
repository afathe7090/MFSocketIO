//
//  SendMessageConnectionEvent.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public struct SendMessageConnectionEvent: ServerConnectionEvent {
    public var event: String { "sendMessage" }
    public init() { }
}
