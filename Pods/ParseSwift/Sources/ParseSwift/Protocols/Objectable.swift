//
//  Objectable.swift
//  ParseSwift
//
//  Created by Corey Baker on 10/4/20.
//  Copyright © 2020 Parse Community. All rights reserved.
//

import Foundation

/// The base protocol for a `ParseObject`.
/// - note: You should not use this directly and instead use `ParseObject`.
public protocol Objectable: ParseType, Decodable {
    /**
    The class name of the object.
    */
    static var className: String { get }

    /**
    The id of the object.
    */
    var objectId: String? { get set }

    /**
    When the object was created.
    */
    var createdAt: Date? { get set }

    /**
    When the object was last updated.
    */
    var updatedAt: Date? { get set }

    /**
    The ACL for this object.
    */
    var ACL: ParseACL? { get set }
}

extension Objectable {
    /**
    The class name of the object.
    */
    public static var className: String {
        let classType = "\(type(of: self))"
        return classType.components(separatedBy: ".").first! // strip .Type
    }

    /**
    The class name of the object.
    */
    public var className: String {
        return Self.className
    }

    static func createHash(_ object: Encodable) throws -> String {
        let encoded = try ParseCoding.parseEncoder().encode(object)
        #if !os(Linux) && !os(Android)
        return ParseHash.md5HashFromData(encoded)
        #else
        guard let hashString = String(data: encoded, encoding: .utf8) else {
            throw ParseError(code: .unknownError, message: "Couldn't create hash")
        }
        return hashString
        #endif
    }
}

// MARK: Convenience
extension Objectable {
    var endpoint: API.Endpoint {
        if let objectId = objectId {
            return .object(className: className, objectId: objectId)
        }

        return .objects(className: className)
    }

    var isSaved: Bool {
        if !ParseSwift.configuration.allowCustomObjectId {
            return objectId != nil
        } else {
            return objectId != nil && createdAt != nil
        }
    }

    func toPointer() throws -> PointerType {
        return try PointerType(self)
    }

    func endpoint(_ method: API.Method) -> API.Endpoint {
        if !ParseSwift.configuration.allowCustomObjectId || method != .POST {
            return endpoint
        } else {
            return .objects(className: className)
        }
    }
}

internal struct UniqueObject: Encodable, Decodable, Hashable {
    let objectId: String

    init?(target: Encodable) {
        guard let objectable = target as? Objectable,
              let objectId = objectable.objectId else {
            return nil
        }
        self.objectId = objectId
    }

    init?(target: Objectable) {
        if let objectId = target.objectId {
            self.objectId = objectId
        } else {
            return nil
        }
    }
}

internal struct BaseObjectable: Objectable {
    var objectId: String?

    var createdAt: Date?

    var updatedAt: Date?

    var ACL: ParseACL?
}
