//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 16/11/23.
//

import Foundation

///  Object that represents a single API call
final class RMRequest {
    ///  API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }

    ///  Desired endpoint
    private let endpoint: RMEndpoit

    ///  Path components for API, if any
    private let pathComponents: [String]

    ///  Query arguments for API, if any
    private let queryParameters: [URLQueryItem]

    ///  Constructed url for api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        if !pathComponents.isEmpty {
            pathComponents.forEach({ string += "/\($0)" })
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }

    ///  Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }

    ///  Desired http method
    public let httpMethod = "GET"

    //  MARK: - Public

    ///  Constructed request
    ///  - Parameters:
    ///    - endpoint: Target endpoint
    ///    - pathComponents: Collection of Path components
    ///    - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoit,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }

    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl + "/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpoinString = components[0]
                if let rmEndpoint = RMEndpoit(rawValue: endpoinString) {
                    self.init(endpoint: rmEndpoint)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpoinString = components[0]
                let queryItemString = components[1]
                let queryItems: [URLQueryItem] = queryItemString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                })
                if let rmEndpoint = RMEndpoit(rawValue: endpoinString) {
                    self.init(endpoint: rmEndpoint, queryParameters: queryItems)
                    return
                }
            }
        }
        return nil
    }
}

extension RMRequest {
    static let listCharacterRequest = RMRequest(endpoint: .character)
}
