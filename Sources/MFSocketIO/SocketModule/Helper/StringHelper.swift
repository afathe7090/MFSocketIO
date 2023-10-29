//
//  StringHelper.swift
//  SocketModule
//
//  Created by Ahmed Fathy on 26/10/2023.
//

import Foundation

public extension String {
    var toDouble: Double {
        Double(self) ?? 0.0
    }
}
