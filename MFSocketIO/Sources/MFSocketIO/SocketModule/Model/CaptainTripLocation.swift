//
//  CaptainTripLocation.swift
//  CAB
//
//  Created by Ahmed Fathy on 23/10/2023.
//

import CoreLocation

public struct CaptainTripLocation: Codable {
    public let captainId: Int
    public let latitute: String
    public let longtute: String
    
    public init(captainId: Int, latitute: String, longtute: String) {
        self.captainId = captainId
        self.latitute = latitute
        self.longtute = longtute
    }
    public  enum CodingKeys: String, CodingKey {
        case captainId = "captain_id"
        case latitute = "lat"
        case longtute = "lng"
    }
}

public extension CaptainTripLocation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitute.toDouble, longitude: longtute.toDouble)
    }
}
