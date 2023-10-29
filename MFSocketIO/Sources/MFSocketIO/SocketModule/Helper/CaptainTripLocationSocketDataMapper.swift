//
//  CaptainTripLocationSocketDataMapper.swift
//  CAB
//
//  Created by Ahmed Fathy on 23/10/2023.
//

struct CaptainTripLocationSocketDataMapper {
    static func map(
        _ captian: CaptainTripLocation
    ) -> SocketData {
        [
            "captain_id": captian.captainId,
            "lat": captian.latitute,
            "lng": captian.longtute
        ]
    }
}
