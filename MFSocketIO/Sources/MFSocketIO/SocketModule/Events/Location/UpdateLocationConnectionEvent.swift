//
//  UpdateLocationConnectionEvent.swift
//  CAB
//
//  Created by Ahmed Fathy on 23/10/2023.
//

import Foundation

public struct UpdateLocationConnectionEvent: ServerConnectionEvent {
    public var event: String { "updateLocation" }
    public init() {}
}
