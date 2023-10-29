//
//  EnterConnectionEvent.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public struct EnterConnectionEvent: ServerConnectionEvent {
    public var event: String { "enterChat" }
    public init() { }
}
