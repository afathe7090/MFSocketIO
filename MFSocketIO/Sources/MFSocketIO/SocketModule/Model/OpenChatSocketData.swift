//
//  OpenChatSocketData.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public struct OpenChatSocketData {
    public let userId: Int
    public let userType: String
    public let roomID: Int
    
    public init(
        userId: Int,
        userType: String,
        roomID: Int
    ) {
        self.userId = userId
        self.userType = userType
        self.roomID = roomID
    }
}
