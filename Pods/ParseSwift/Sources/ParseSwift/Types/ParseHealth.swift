//
//  ParseHealth.swift
//  ParseSwift
//
//  Created by Corey Baker on 4/28/21.
//  Copyright © 2021 Parse Community. All rights reserved.
//

import Foundation

/**
  `ParseHealth` allows you to check the health of a Parse Server.
 */
public struct ParseHealth: ParseType, Decodable {

    /**
     Calls the health check function *synchronously* and returns a result of it's execution.
        - parameter options: A set of header options sent to the server. Defaults to an empty set.
        - returns: Returns the status of the server.
        - throws: An error of type `ParseError`.
    */
    static public func check(options: API.Options = []) throws -> String {
        try healthCommand().execute(options: options)
    }

    /**
     Calls the health check function *asynchronously* and returns a result of it's execution.
        - parameter options: A set of header options sent to the server. Defaults to an empty set.
        - parameter callbackQueue: The queue to return to after completion. Default value of .main.
        - parameter completion: A block that will be called when the health check completes or fails.
        It should have the following argument signature: `(Result<String, ParseError>)`.
    */
    static public func check(options: API.Options = [],
                             callbackQueue: DispatchQueue = .main,
                             completion: @escaping (Result<String, ParseError>) -> Void) {
        healthCommand()
            .executeAsync(options: options) { result in
                callbackQueue.async {
                    completion(result)
                }
            }
    }

    internal static func healthCommand() -> API.NonParseBodyCommand<NoBody, String> {
        return API.NonParseBodyCommand(method: .POST,
                                       path: .health) { (data) -> String in
            return try ParseCoding.jsonDecoder().decode(HealthResponse.self, from: data).status
        }
    }
}
