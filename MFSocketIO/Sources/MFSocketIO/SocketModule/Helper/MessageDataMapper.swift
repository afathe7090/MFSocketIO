//
//  MessageDataMapper.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

public struct MessageDataMapper {
    static func map(_ messageData: MessageData) -> [String:Any] {
        [
            "room_id": messageData.roomID,
            "receiver_id": messageData.receiverID,
            "receiver_type": messageData.receiverType,
            "sender_id": messageData.senderID,
            "sender_type": messageData.senderType,
            "sender_name": messageData.senderName,
            "avatar": messageData.avatar,
            "type": messageData.messageType,
            "body": messageData.messageBody,
            "created_at": messageData.createdAt,
        ]
    }
}
