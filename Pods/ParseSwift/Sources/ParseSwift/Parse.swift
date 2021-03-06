import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// swiftlint:disable line_length

/// The Configuration for a Parse client.
public struct ParseConfiguration {

    /// The application id of your Parse application.
    var applicationId: String

    /// The master key of your Parse application.
    var masterKey: String? // swiftlint:disable:this inclusive_language

    /// The client key of your Parse application.
    var clientKey: String?

    /// The server URL to connect to Parse Server.
    var serverURL: URL

    /// The live query server URL to connect to Parse Server.
    var liveQuerysServerURL: URL?

    /// Allows objectIds to be created on the client.
    var allowCustomObjectId = false

    /// Use transactions inside the Client SDK.
    /// - warning: This is experimental and known not to work with mongoDB.
    var useTransactionsInternally = false

    internal var authentication: ((URLAuthenticationChallenge,
                                   (URLSession.AuthChallengeDisposition,
                                    URLCredential?) -> Void) -> Void)?
    internal var mountPath: String
    internal var isTestingSDK = false //Enable this only for certain tests like ParseFile

    /**
     Create a Parse Swift configuration.
     - parameter applicationId: The application id of your Parse application.
     - parameter clientKey: The client key of your Parse application.
     - parameter masterKey: The master key of your Parse application.
     - parameter serverURL: The server URL to connect to Parse Server.
     - parameter liveQueryServerURL: The live query server URL to connect to Parse Server.
     - parameter allowCustomObjectId: Allows objectIds to be created on the client.
     side for each object. Must be enabled on the server to work.
     - parameter useTransactionsInternally: Use transactions inside the Client SDK.
     - parameter keyValueStore: A key/value store that conforms to the `ParseKeyValueStore`
     protocol. Defaults to `nil` in which one will be created an memory, but never persisted. For Linux, this
     this is the only store available since there is no Keychain. Linux users should replace this store with an
     encrypted one.
     - parameter authentication: A callback block that will be used to receive/accept/decline network challenges.
     Defaults to `nil` in which the SDK will use the default OS authentication methods for challenges.
     It should have the following argument signature: `(challenge: URLAuthenticationChallenge,
     completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void`.
     See Apple's [documentation](https://developer.apple.com/documentation/foundation/urlsessiontaskdelegate/1411595-urlsession) for more for details.
     - warning: `useTransactionsInternally` is experimental and known not to work with mongoDB.
     */
    public init(applicationId: String,
                clientKey: String? = nil,
                masterKey: String? = nil,
                serverURL: URL,
                liveQueryServerURL: URL? = nil,
                allowCustomObjectId: Bool = false,
                useTransactionsInternally: Bool = false,
                keyValueStore: ParseKeyValueStore? = nil,
                authentication: ((URLAuthenticationChallenge,
                                  (URLSession.AuthChallengeDisposition,
                                   URLCredential?) -> Void) -> Void)? = nil) {
        self.applicationId = applicationId
        self.clientKey = clientKey
        self.masterKey = masterKey
        self.serverURL = serverURL
        self.liveQuerysServerURL = liveQueryServerURL
        self.allowCustomObjectId = allowCustomObjectId
        self.useTransactionsInternally = useTransactionsInternally
        self.mountPath = "/" + serverURL.pathComponents
            .filter { $0 != "/" }
            .joined(separator: "/")
        self.authentication = authentication
        ParseStorage.shared.use(keyValueStore ?? InMemoryKeyValueStore())
    }
}

/**
 `ParseSwift` contains static methods to handle global configuration for the Parse framework.
 */
public struct ParseSwift {

    static var configuration: ParseConfiguration!
    static var sessionDelegate: ParseURLSessionDelegate!

    /**
     Configure the Parse Swift client. This should only be used when starting your app. Typically in the
     `application(... didFinishLaunchingWithOptions launchOptions...)`.
     - parameter configuration: The Parse configuration.
     */
    static public func initialize(configuration: ParseConfiguration,
                                  migrateFromObjcSDK: Bool = false) {
        Self.configuration = configuration
        Self.sessionDelegate = ParseURLSessionDelegate(callbackQueue: .main,
                                                       authentication: configuration.authentication)

        //Migrate old installations made with ParseSwift < 1.3.0
        if let currentInstallation = BaseParseInstallation.current {
            if currentInstallation.objectId == nil {
                BaseParseInstallation.deleteCurrentContainerFromKeychain()
                //Prepare installation
                _ = BaseParseInstallation()
            }
        } else {
            //Prepare installation
            _ = BaseParseInstallation()
        }

        #if !os(Linux) && !os(Android)
        if migrateFromObjcSDK {
            if let identifier = Bundle.main.bundleIdentifier {
                let objcParseKeychain = KeychainStore(service: "\(identifier).com.parse.sdk")
                guard let installationId: String = objcParseKeychain.object(forKey: "installationId"),
                      BaseParseInstallation.current?.installationId != installationId else {
                    return
                }
                var updatedInstallation = BaseParseInstallation.current
                updatedInstallation?.installationId = installationId
                BaseParseInstallation.currentInstallationContainer.installationId = installationId
                BaseParseInstallation.currentInstallationContainer.currentInstallation = updatedInstallation
                BaseParseInstallation.saveCurrentContainerToKeychain()
            }
        }
        #endif
    }

    /**
     Configure the Parse Swift client. This should only be used when starting your app. Typically in the
     `application(... didFinishLaunchingWithOptions launchOptions...)`.
     - parameter applicationId: The application id of your Parse application.
     - parameter clientKey: The client key of your Parse application.
     - parameter masterKey: The master key of your Parse application.
     - parameter serverURL: The server URL to connect to Parse Server.
     - parameter liveQueryServerURL: The live query server URL to connect to Parse Server.
     - parameter allowCustomObjectId: Allows objectIds to be created on the client.
     side for each object. Must be enabled on the server to work.
     - parameter useTransactionsInternally: Use transactions inside the Client SDK.
     - parameter keyValueStore: A key/value store that conforms to the `ParseKeyValueStore`
     protocol. Defaults to `nil` in which one will be created an memory, but never persisted. For Linux, this
     this is the only store available since there is no Keychain. Linux users should replace this store with an
     encrypted one.
     - parameter migrateFromObjcSDK: If your app previously used the iOS Objective-C SDK, setting this value
     to `true` will attempt to migrate relevant data stored in the Keychain to ParseSwift. Defaults to `false`.
     - parameter authentication: A callback block that will be used to receive/accept/decline network challenges.
     Defaults to `nil` in which the SDK will use the default OS authentication methods for challenges.
     It should have the following argument signature: `(challenge: URLAuthenticationChallenge,
     completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void`.
     See Apple's [documentation](https://developer.apple.com/documentation/foundation/urlsessiontaskdelegate/1411595-urlsession) for more for details.
     - warning: `useTransactionsInternally` is experimental and known not to work with mongoDB.
     */
    static public func initialize(
        applicationId: String,
        clientKey: String? = nil,
        masterKey: String? = nil,
        serverURL: URL,
        liveQueryServerURL: URL? = nil,
        allowCustomObjectId: Bool = false,
        useTransactionsInternally: Bool = false,
        keyValueStore: ParseKeyValueStore? = nil,
        migrateFromObjcSDK: Bool = false,
        authentication: ((URLAuthenticationChallenge,
                          (URLSession.AuthChallengeDisposition,
                           URLCredential?) -> Void) -> Void)? = nil
    ) {
        initialize(configuration: .init(applicationId: applicationId,
                                        clientKey: clientKey,
                                        masterKey: masterKey,
                                        serverURL: serverURL,
                                        liveQueryServerURL: liveQueryServerURL,
                                        allowCustomObjectId: allowCustomObjectId,
                                        useTransactionsInternally: useTransactionsInternally,
                                        keyValueStore: keyValueStore,
                                        authentication: authentication),
                   migrateFromObjcSDK: migrateFromObjcSDK)
    }

    internal static func initialize(applicationId: String,
                                    clientKey: String? = nil,
                                    masterKey: String? = nil,
                                    serverURL: URL,
                                    liveQueryServerURL: URL? = nil,
                                    allowCustomObjectId: Bool = false,
                                    useTransactionsInternally: Bool = false,
                                    keyValueStore: ParseKeyValueStore? = nil,
                                    migrateFromObjcSDK: Bool = false,
                                    testing: Bool = false,
                                    authentication: ((URLAuthenticationChallenge,
                                                      (URLSession.AuthChallengeDisposition,
                                                       URLCredential?) -> Void) -> Void)? = nil) {
        initialize(configuration: .init(applicationId: applicationId,
                                        clientKey: clientKey,
                                        masterKey: masterKey,
                                        serverURL: serverURL,
                                        liveQueryServerURL: liveQueryServerURL,
                                        allowCustomObjectId: allowCustomObjectId,
                                        useTransactionsInternally: useTransactionsInternally,
                                        keyValueStore: keyValueStore,
                                        authentication: authentication),
                   migrateFromObjcSDK: migrateFromObjcSDK)
        Self.configuration.isTestingSDK = testing
    }

    /**
     Update the authentication callback.
     - parameter authentication: A callback block that will be used to receive/accept/decline network challenges.
     Defaults to `nil` in which the SDK will use the default OS authentication methods for challenges.
     It should have the following argument signature: `(challenge: URLAuthenticationChallenge,
     completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) -> Void`.
     See Apple's [documentation](https://developer.apple.com/documentation/foundation/urlsessiontaskdelegate/1411595-urlsession) for more for details.
     */
    static public func updateAuthentication(_ authentication: ((URLAuthenticationChallenge,
                                                         (URLSession.AuthChallengeDisposition,
                                                          URLCredential?) -> Void) -> Void)?) {
        Self.sessionDelegate = ParseURLSessionDelegate(callbackQueue: .main,
                                                       authentication: authentication)
    }

    #if !os(Linux) && !os(Android)
    /**
     Delete the Parse iOS Objective-C SDK Keychain from the device.
     - note: ParseSwift uses a different Keychain. After migration, the iOS Objective-C SDK Keychain is no longer needed.
     - warning: The keychain cannot be recovered after deletion.
     */
    static public func deleteObjectiveCKeychain() throws {
        if let identifier = Bundle.main.bundleIdentifier {
            let objcParseKeychain = KeychainStore(service: "\(identifier).com.parse.sdk")
            try objcParseKeychain.deleteAll()
        }
    }
    #endif
}
