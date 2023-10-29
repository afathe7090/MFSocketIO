//
//  DriverLocationConnectionEvent.swift
//  CAB
//
//  Created by Ahmed Fathy on 23/10/2023.
//
public struct DriverLocationConnectionEvent: ServerConnectionEvent {
    public var event: String { "driverLocation" }
    public init() {}
}

