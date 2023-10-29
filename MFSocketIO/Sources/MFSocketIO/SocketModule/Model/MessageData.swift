//
//  MessageData.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

import Foundation

public struct MessageData: Codable {
    public let roomID, receiverID: Int
    public let receiverType: String
    public let senderID: Int
    public let senderType, senderName: String
    public let avatar: String
    public let messageType, messageBody, createdAt: String
    
    public init(
        roomID: Int,
        receiverID: Int,
        receiverType: String,
        senderID: Int,
        senderType: String,
        senderName: String,
        avatar: String,
        messageType: String,
        messageBody: String,
        createdAt: String
    ) {
        self.roomID = roomID
        self.receiverID = receiverID
        self.receiverType = receiverType
        self.senderID = senderID
        self.senderType = senderType
        self.senderName = senderName
        self.avatar = avatar
        self.messageType = messageType
        self.messageBody = messageBody
        self.createdAt = createdAt
    }
    
    public enum CodingKeys: String, CodingKey {
        case roomID = "room_id"
        case receiverID = "receiver_id"
        case receiverType = "receiver_type"
        case senderID = "sender_id"
        case senderType = "sender_type"
        case senderName = "sender_name"
        case avatar
        case messageType = "type"
        case messageBody = "body"
        case createdAt = "created_at"
    }
}
