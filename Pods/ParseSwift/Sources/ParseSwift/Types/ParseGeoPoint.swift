import Foundation
#if canImport(CoreLocation)
import CoreLocation
#endif

/**
  `ParseGeoPoint` is used to embed a latitude / longitude point as the value for a key in a `ParseObject`.
   It could be used to perform queries in a geospatial manner using `ParseQuery.whereKey:nearGeoPoint:`.
   Currently, instances of `ParseObject` may only have one key associated with a `ParseGeoPoint` type.
*/
public struct ParseGeoPoint: Codable, Hashable {
    private let __type: String = "GeoPoint" // swiftlint:disable:this identifier_name
    static let earthRadiusMiles = 3958.8
    static let earthRadiusKilometers = 6371.0

    enum CodingKeys: String, CodingKey {
        case __type, latitude, longitude // swiftlint:disable:this identifier_name
    }

    /**
      Latitude of point in degrees. Valid range is from `-90.0` to `90.0`.
    */
    public var latitude: Double {
        get {
            return _latitude
        }
        set {
            assert(newValue > -90, "latitude should be > -90")
            assert(newValue < 90, "latitude should be > 90")
            _latitude = newValue
        }
    }

    /**
      Longitude of point in degrees. Valid range is from `-180.0` to `180.0`.
    */
    public var longitude: Double {
        get {
            return _longitude
        }
        set {
            assert(newValue > -180, "longitude should be > -180")
            assert(newValue < 180, "longitude should be > -180")
            _longitude = newValue
        }
    }

    private var _latitude: Double
    private var _longitude: Double

    /**
     Create a `ParseGeoPoint` instance. Latitude and longitude are set to `0.0`.
     */
    public init() {
        _latitude = 0.0
        _longitude = 0.0
    }

    /**
      Create a new `ParseGeoPoint` instance with the specified latitude and longitude.
       - parameter latitude: Latitude of point in degrees.
       - parameter longitude: Longitude of point in degrees.
     */
    public init(latitude: Double, longitude: Double) {
        assert(longitude > -180, "longitude should be > -180")
        assert(longitude < 180, "longitude should be > -180")
        assert(latitude > -90, "latitude should be > -90")
        assert(latitude < 90, "latitude should be > 90")
        self._latitude = latitude
        self._longitude = longitude
    }

    #if canImport(CoreLocation)
    /**
      Creates a new `ParseGeoPoint` instance for the given `CLLocation`, set to the location's coordinates.
       - parameter location: Instance of `CLLocation`, with set latitude and longitude.
     */
    public init(location: CLLocation) {
        self._longitude = location.coordinate.longitude
        self._latitude = location.coordinate.latitude
    }
    #endif

    /**
     Get distance in radians from this point to specified point.

     - parameter point: `ParseGeoPoint` that represents the location of other point.
     - returns: Distance in radians between the receiver and `point`.
    */
    public func distanceInRadians(_ point: ParseGeoPoint) -> Double {
        let d2r: Double = .pi / 180.0 // radian conversion factor
        let lat1rad = self.latitude * d2r
        let long1rad = self.longitude * d2r
        let lat2rad = point.latitude * d2r
        let long2rad = point.longitude * d2r
        let deltaLat = lat1rad - lat2rad
        let deltaLong = long1rad - long2rad
        let sinDeltaLatDiv2 = sin(deltaLat / 2.0)
        let sinDeltaLongDiv2 = sin(deltaLong / 2.0)
        // Square of half the straight line chord distance between both points. [0.0, 1.0]
        var partialDistance = sinDeltaLatDiv2 * sinDeltaLatDiv2 +
            cos(lat1rad) * cos(lat2rad) * sinDeltaLongDiv2 * sinDeltaLongDiv2
        partialDistance = fmin(1.0, partialDistance)
        return 2.0 * asin(sqrt(partialDistance))
    }

    /**
     Get distance in miles from this point to specified point.

     - parameter point: `ParseGeoPoint` that represents the location of other point.
     - returns: Distance in miles between the receiver and `point`.
    */
    public func distanceInMiles(_ point: ParseGeoPoint) -> Double {
        return distanceInRadians(point) * Self.earthRadiusMiles
    }

    /**
     Get distance in kilometers from this point to specified point.
     - parameter point: `ParseGeoPoint` that represents the location of other point.
     - returns: Distance in kilometers between the receiver and `point`.
    */
    public func distanceInKilometers(_ point: ParseGeoPoint) -> Double {
        return distanceInRadians(point) * Self.earthRadiusKilometers
    }
}

extension ParseGeoPoint {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _longitude = try values.decode(Double.self, forKey: .longitude)
        _latitude = try values.decode(Double.self, forKey: .latitude)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(__type, forKey: .__type)
        try container.encode(_longitude, forKey: .longitude)
        try container.encode(_latitude, forKey: .latitude)
    }
}

extension ParseGeoPoint: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard let descriptionData = try? ParseCoding.jsonEncoder().encode(self),
            let descriptionString = String(data: descriptionData, encoding: .utf8) else {
            return "GeoPoint ()"
        }
        return "GeoPoint (\(descriptionString))"
    }
}
