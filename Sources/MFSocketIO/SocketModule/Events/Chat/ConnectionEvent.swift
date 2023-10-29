//
//  ConnectionEvent.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public protocol ServerConnectionEvent {
    var event: String { get }
}
