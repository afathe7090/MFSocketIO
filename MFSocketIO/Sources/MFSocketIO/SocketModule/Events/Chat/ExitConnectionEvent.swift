//
//  ExitConnectionEvent.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public struct ExitConnectionEvent: ServerConnectionEvent {
    public var event: String { "exitChat" }
    public init() { }
}
