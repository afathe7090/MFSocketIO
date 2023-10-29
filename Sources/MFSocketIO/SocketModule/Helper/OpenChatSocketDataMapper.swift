//
//  OpenChatSocketDataMapper.swift
//  ChatSocket
//
//  Created by Ahmed Fathy on 17/10/2023.
//

struct OpenChatSocketDataMapper {
    static func map(_ connectChat: OpenChatSocketData) -> [String:Any] {
        [
            "userid": connectChat.userId,
            "user_type": connectChat.userType,
            "room_id": connectChat.roomID
        ]
    }
}
